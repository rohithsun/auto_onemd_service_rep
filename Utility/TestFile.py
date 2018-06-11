from simple_salesforce import Salesforce
from collections import OrderedDict
from robot.libraries.BuiltIn import BuiltIn
import getaccesstoken

# Lighting version of SFDC
test_url = "https://ap5.salesforce.com"
token_url = "https://ap5.salesforce.com/services/oauth2/token"
user = "rohithsun@cts.com"
password = "Panda@123WGOeZzb8dIBS23ouDwi67pqT"
client_id = '3MVG9d8..z.hDcPIlLq.s4DoAPiNHB0IoaqTS6gtJznRo5IV8zctdYfvosXlFY6I7ANmJ4AXPXNGQLKa80vUO'
client_secret = "2391836052489871744"
#
session_id = getaccesstoken.getAccesstoken(token_url, client_id, client_secret, user, password)
sf = Salesforce(instance_url=test_url, session_id=session_id, sandbox=True)


def get_all_tabs(sf, flag=None):
    sfdc_all_tabs_data = sf.query_more("/services/data/v41.0/tabs", True)
    std_tablabelList = []
    std_sobjectNameList = []
    cust_tablabelList = []
    cust_sobjectNameList = []
    for label in sfdc_all_tabs_data:
        if isinstance(label, OrderedDict):
            for tabl, tabv in label.iteritems():
                if 'custom' in tabl and tabv == True:
                    flag = 0
                    continue
                elif 'custom' in tabl and tabv == False:
                    flag = 1
                    continue
                if flag == 1:
                    if 'label' in tabl:
                        std_tablabelList.append(tabv)
                    if 'sobjectName' in tabl:
                        std_sobjectNameList.append(tabv)
                if flag == 0:
                    if 'label' in tabl:
                        cust_tablabelList.append(tabv)
                    if 'sobjectName' in tabl:
                        cust_sobjectNameList.append(tabv)
    print std_tablabelList
    print std_sobjectNameList
    print cust_tablabelList
    print cust_sobjectNameList

get_all_tabs(sf)