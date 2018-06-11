import datetime


def mytime(name):
    return name + ' ' + str(datetime.datetime.now()).split(".")[0]


