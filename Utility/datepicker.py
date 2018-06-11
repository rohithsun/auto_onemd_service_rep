from datetime import datetime
import logging


def pick_date_li(mm):
    #MM/DD/YYYY
    # today = datetime.today()
    currentMonth = datetime.now().strftime('%B')
    month = {'January': 1, 'February': 2, 'March': 3, 'April': 4, 'May': 5, 'June': 6,
             'July': 7, 'August': 8, 'September': 9, 'October': 10, 'November': 11, 'December': 12}

    cm = int(month[currentMonth])
    mm = int(mm)
    incdec = mm-cm

    if incdec > 0:
        logging.info('increasing the month')
        return 'increase', abs(incdec)
    elif incdec < 0:
        logging.info('decreasing the month')
        return 'decrease', abs(incdec)
    elif abs(incdec) == 0:
        logging.info('no change in month')