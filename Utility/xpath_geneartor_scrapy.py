from selenium import webdriver
from lxml import html

import time



def trigger():
    # page = requests.get(URL_input.get(), auth=(Username_input.get(), Password_input.get()))
    #
    # print page.status_code
    #
    # print page.raise_for_status()
    driver = webdriver.Chrome(
        "C:\Python27\chromedriver.exe")  # Optional argument, if not specified will search path.
    driver.get("https://test.salesforce.com")
    driver.find_element_by_id("username").send_keys("sveeras@jjfsr.com.sit")
    driver.find_element_by_id("password").send_keys("Start1234")
    driver.find_element_by_id("Login").click()

    driver.refresh();
    time.sleep(5)
    #driver."https://fsr--sit.cs90.my.salesforce.com/a3F1F0000000fXC")
    driver.get("https://fsr--sit--c.cs90.visual.force.com/apex/WorkOrderEdit_MDSR?retURL=%2Fa3F%2Fo&save_new=1&sfdc.override=1")
    time.sleep(3)
    print driver.current_url
    html_source = driver.page_source

    root = html.fromstring(html_source)

    tree = root.getroottree()
    # print tree
    # //*[@type='text' or @type='password' or @type='checkbox' or @type='submit' or @type='email'] or //a or //input or //h3
    result = root.xpath("//*[@type='text' or @class='lookupicon' or @type='checkbox' or @type='submit' or @href or @title]")
    print result
    #
    new_dict = dict()
    ex_dict=dict()
    for r in result:
        new_dict={"id":'%s' % root.xpath(tree.getpath(r) + '/@id'), "Xpath":'%s' % tree.getpath(r),"type":'%s' % root.xpath(tree.getpath(r) + '/@type'),"label":'%s' % root.xpath(tree.getpath(r) + '//text()')}
        try:
            if new_dict['type']!="['hidden']":
               if new_dict['id']!="[]":
                   print "id is %s" % root.xpath(tree.getpath(r) + '/@id'), "xpath is %s" % tree.getpath(r)
               elif new_dict['label'] != "[]":
                     print "Label is %s" %root.xpath(tree.getpath(r) + '//text()'), "Xpath is %s" % tree.getpath(r)

               else:
                    l = new_dict['Xpath']
                    tree.getpath(r)
                    x=l.split('/')#[0:-1]
                    print ('/'.join(x))



            else:
                continue

                #',,'input=%s' % root.xpath(tree.getpath(r) + '/@input'),'text=%s' % root.xpath(tree.getpath(r) + '/@text')
        except:
            print "no Attribute"



trigger()
#
# r = '/html/body/div/div[1]/table/tbody/tr/td[1]'
#
# print r.split('/')[0:-2]

