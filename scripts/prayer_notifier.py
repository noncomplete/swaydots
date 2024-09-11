## Prayer notifier
import datetime
import pandas as pd
from notify import notification

# load data
df = pd.read_csv("prayer_table_2024.csv")


##
# month, hijri, day, fajr, sunrise, dhuhr, asr, magrib, isha
#
def convert24(time):
    t = datetime.datetime.strptime(time, "%I:%M %p")
    return t.strftime("%H:%M")


def send_notification(name_var, time_var):
    notification("--> Salah Time <--", message=f"<b>{name_var} @ {time_var}</b>")


def next_fajr():
    day = datetime.datetime.today() + datetime.timedelta(days=1)
    month = day.strftime("%B")
    day = int(day.strftime("%d"))
    data = df.query("Month == @month and Day == @day")
    next_fajr_time = convert24(data["Fajr"].item())
    return next_fajr_time


today = datetime.datetime.today()
current_day = int(today.strftime("%d"))
current_month = today.strftime("%B")
result = df.query("Month == @current_month and Day == @current_day")

waqt_cols = list(result.columns)[3:]
waqt_time = []
for cols in waqt_cols:
    waqt_time.append(convert24(result[cols].item()))

waqt = {waqt_cols[i]: waqt_time[i] for i in range(len(waqt_time))}

##
now = datetime.datetime.now()
current_time = now.strftime("%H:%M")

past_waqt = []
for x in waqt.keys():
    if current_time > waqt[x]:
        past_waqt.append(True)
    else:
        past_waqt.append(False)


def get_waqt():
    for x in waqt.keys():
        if current_time > waqt[x]:
            pass
        else:
            return x


def get_prayer_time():
    return waqt[get_waqt()]


goto_next_fajr = all(past_waqt)
if goto_next_fajr:
    send_notification("Fajr", next_fajr())
else:
    send_notification(get_waqt(), get_prayer_time())
