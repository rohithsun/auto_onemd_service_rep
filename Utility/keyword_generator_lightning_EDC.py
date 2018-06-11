from simple_salesforce import Salesforce
from collections import OrderedDict
from robot.libraries.BuiltIn import BuiltIn



class keyword_generator():

    def generateXpath(self, object, sf, sf_type):
        objectlayouts = ['detailLayoutSections', 'editLayoutSections', 'relatedLists', 'buttonLayoutSection']

        obj = getattr(sf, object)

        xpathList = []
        editkeywordList = []
        detailkeywordList = []
        pagebuttonkeyList = []
        csv_label_list = []
        for layout in objectlayouts:
            labels = obj.describe_layout('012000000000000AAA')[layout]

            def labelType(labels):
                if sf_type is 'classic':
                    if 'edit' in layout:
                        if labels in ('string','date','datetime','double','phone','url','currency','email','address', 'number', 'percent','text','fax','long','name','int'):
                            return 'input[1]', 'input text'
                        elif labels == 'textarea':
                            return 'textarea[1]', 'input text'
                        elif labels == 'picklist':
                            return 'select[1]', 'Select From List By Value'
                        elif labels in ('reference','lookup'):
                            return 'img[1]', 'Select From LookUp'
                        elif labels in ('boolean','checkbox'):
                            return 'checkbox[1]', 'click element'
                        elif labels == labels:
                            print labels
                    else:
                        return 'div[1]', 'click element'

                if sf_type is 'lightning':
                    if 'edit' in layout:
                        if labels in ('string','double','phone','url','currency','email','address', 'number', 'percent','text','fax','long','name','int'):
                            return 'input[1]', 'input text'
                        elif labels in ('date','datetime'):
                            return 'input[1]', 'Select Date Li'
                        elif labels == 'textarea':
                            return 'textarea[1]', 'input text'
                        elif labels == 'picklist':
                            return 'a[1]', 'Select From Menu List Li'
                        elif labels in ('reference','lookup'):
                            return 'input[1]', 'Select From LookUp Li'
                        elif labels in ('boolean','checkbox'):
                            return 'checkbox[1]', 'click element'
                        elif labels == labels:
                            print labels
                    else:
                        return 'div[1]', 'click element'

            def generateXpath_detail_edit_layouts(object, header, labels, xpath=None):
                if 'edit' in layout:
                    Sectionheader = '\n''#  EditLayout: %s section locators'%header
                    xpathList.append(Sectionheader)

                    eidtSectionheaderkey = '\n''#  EditLayout: %s section keyword' % header
                    editkeywordList.append(eidtSectionheaderkey)

                    editkeywordname = '%sPage.Enter Editlayout %s section'%(object,header)
                    editkeywordList.append(editkeywordname)
                    #
                    # dataheader = '\n''#  EditLayout: %s section field names' % header
                    # csv_label_list.append(dataheader)

                    # arg = '    [Arguments]  ${testdata_row}'
                    # editkeywordList.append(arg)
                # else:
                #     Sectionheader = '\n''#  DetailLayout: %s section locators'%header
                #     xpathList.append(Sectionheader)
                #
                #     deSectionheaderkey = '\n''#  DetailLayout: %s section keyword' % header
                #     detailkeywordList.append(deSectionheaderkey)
                #
                #     detailkeywordname = '%sPage.Click On Element in %s Detaillayout'%(object,header)
                #     keyarg = '    [Arguments]  ${element}'
                #     detailkeywordList.append(detailkeywordname)
                #     detailkeywordList.append(keyarg)
                iterlist = iter(labels)
                for objtype in iterlist:
                    if objtype != '':
                        o = object.replace(' ', '_')
                        h = header.replace(' ', '_')
                        l = objtype.replace('.', '').replace('/', '_').replace('(s)', '').replace(' ', '_')
                        type, seleniumkeyword = labelType(next(iterlist))

                        if 'edit' in layout:
                            # editlayout = '&{%s_editlayout_%s_%s_loc}  xpath=%s  css=%s' %(o, h, l, xpath, css)
                            # editlayout = '${%s_editlayout_%s_%s_loc}  %s' % (o, h, l, xpath)

                            if sf_type is 'classic':
                                xpath = "//label[text()=\\'%s\\']/following::%s" % (objtype, type)
                                # css = ''

                                editlayout = '%s_editlayout_%s_%s_loc = \'%s\'' % (o, h, l, xpath)
                                xpathList.append(editlayout)

                                editscriptline = "    %s  ${pvar('%s_editlayout_%s_%s_loc')}  ${pvar('%s')}"%(seleniumkeyword,o, h, l,l)
                                editkeywordList.append(editscriptline)

                            elif sf_type is 'lightning':
                                xpath = "//div[contains(@class, \\'modal-body\\')]//*[text()=\\'%s\\']/following::%s" % (objtype, type)
                                # css = ''

                                editlayout = '%s_editlayout_%s_%s_li_loc = \'%s\'' % (o, h, l, xpath)
                                xpathList.append(editlayout)

                                editscriptline = "    %s  ${pvar('%s_editlayout_%s_%s_li_loc')}  ${pvar('%s')}"%(seleniumkeyword,o, h, l,l)
                                editkeywordList.append(editscriptline)

#                                 editlayout = '%s_editlayout_%s_%s_loc = \'%s\'' % (o, h, l, xpath)
#                                 xpathList.append(editlayout)
                            # editscriptline = "    run keyword if  '${testdata_row['%s Edit']}' is not 'nan'  %s  ${%s_editlayout_%s_%s_loc}  ${testdata_row['%s Edit']}"%(objtype,seleniumkeyword,o, h, l,objtype)
#                                 editscriptline = "    %s  ${pvar('%s_editlayout_%s_%s_loc')}  ${pvar('%s')}"%(seleniumkeyword,o, h, l,l)
#                                 editkeywordList.append(editscriptline)
                        # else:
                        #     detaillayout = '&{%s_detaillayout_%s_%s_loc}  xpath=%s  css=%s' % (o, h, l, xpath, css)
                            # detaillayout = '${%s_detaillayout_%s_%s_loc}  %s' %(o, h, l, xpath)
                            # xpathList.append(detaillayout)
                            # detailscriptline = "    run keyword if  '%s' == ${element}  %s  ${%s_detaillayout_%s_%s_loc}"%(objtype,seleniumkeyword,o, h, l)
                            # detailkeywordList.append(detailscriptline)

            def generateXpath_page_buttons(object, labels):
                # pagebuttonkeyList = []
                # xpath for page buttons
                if len(labels)>0:
                    for btn in labels:
                        o = object.replace(' ', '_')
                        b = btn.replace(' ', '_')

                        if sf_type is 'classic':
                            # xpath = "//td[@class='pbButton']//input[@title='%s']" % btn
                            # css = ''
                            # pagebutton = '${%s_pagebtn_%s_loc}  %s' % (o, b, xpath)
                            # xpathList.append(pagebutton)
                            pagebuttonkey = '\n''# Keyword to click "%s" top level page button' % btn
                            pagebuttonkeyList.append(pagebuttonkey)
                            pagebuttonkey = '%sPage.Click On \'%s\' TabPage Button' % (object, btn)
                            pagebuttonkeyList.append(pagebuttonkey)
                            pagebuttonkey = '    Click On \'%s\' TabPage Button' %btn
                            pagebuttonkeyList.append(pagebuttonkey)
                        elif sf_type is 'lightning':
                            # xpath = "//ul/li/a[@title='%s']" % btn
                            # css = ''
                            # pagebutton = '${%s_pagebtn_%s_loc}  %s' % (o, b, xpath)
                            # xpathList.append(pagebutton)
                            pagebuttonkey = '\n''# Keyword to click "%s" top level page button' % btn
                            pagebuttonkeyList.append(pagebuttonkey)
                            pagebuttonkey = '%sPage.Click On \'%s\' TabPage Button Li' % (object, btn)
                            pagebuttonkeyList.append(pagebuttonkey)
                            pagebuttonkey = '    Click On \'%s\' TabPage Button Li' % btn
                            pagebuttonkeyList.append(pagebuttonkey)

                        # pagebutton = '&{%s_pagebtn_%s_loc}  xpath=%s  css=%s' %(o,b,xpath,css)

            def genearateXpath_relList_buttons(object, relatedlist, buttons, xpath=None):
                # xpath for relatedlist buttons
                if len(buttons)>0:
                    RLPageBtnheader = '\n''#  %s Related List Button locators' % relatedlist
                    xpathList.append(RLPageBtnheader)
                    for btn in buttons:
                        o = object.replace(' ', '_')
                        b = btn.replace(' ', '_')
                        rl = relatedlist.replace(' ', '_')

                        if sf_type is 'classic':
                            xpath = "//h3[text()=\\'%s\\']/following::input[@title=\\'%s\\']" % (relatedlist, btn)
                            #css = ''
                            
                            relSectionBtn = '%s_relSection_btn_%s_%s_loc = \'%s\'' % (o, rl, b, xpath)
                            xpathList.append(relSectionBtn)
                        
                        elif sf_type is 'lightning':
                            xpath = "//h2[@id=\\'header\\']//span[text()=\\'%s\\']/following::a[@title=\\'%s\\'][1]" % (relatedlist, btn)
                            # css = ''
                            
                            relSectionBtn = '%s_relSection_btn_%s_%s_li_loc = \'%s\'' % (o, rl, b, xpath)
                            xpathList.append(relSectionBtn)

                        # relSectionBtn = '&{%s_relSection_btn_%s_%s_loc}  xpath=%s  css=%s' % (o,rl,b,xpath,css)
#                         relSectionBtn = '%s_relSection_btn_%s_%s_loc = \'%s\'' % (o, rl, b, xpath)
                        # relSectionBtn = '%sPage.Click On \'%s\' Section \'%s\' Button Li'%(object,relatedlist,btn)
#                         xpathList.append(relSectionBtn)
                else:
                    RLPageBtnheader = '\n''#  %s Related List HAS NO Buttons' % relatedlist
                    xpathList.append(RLPageBtnheader)

            def DescribeLayouts(contact):
                for items in contact:
                    datalist = []
                    if isinstance(items, OrderedDict):
                        for key, value in items.iteritems():
                            if key == 'heading':
                                global header
                                header = value
                            if key == 'layoutRows':
                                if 'edit' in layout:
                                    dataheader = '\n''#  EditLayout: %s section field names' % header
                                    csv_label_list.append(dataheader)
                                if isinstance(value, list):
                                    for layoutitems in value:
                                        if isinstance(layoutitems, OrderedDict):
                                            for data1, data2 in layoutitems.iteritems():
                                                if isinstance(data2, list):
                                                    for detaildata in data2:
                                                        for k in detaildata['layoutComponents']:
                                                            if isinstance(k, OrderedDict):
                                                                for kd, kv in k.iteritems():
                                                                    if kd == 'details':
                                                                        detailLabel = detaildata['label']
                                                                        datalist.append(detailLabel)
                                                                        # if 'edit' in layout:
                                                                        #     editlabel = '%s Edit'%detailLabel
                                                                        #     csv_label_list.append(editlabel)
                                                                        # else:
                                                                        #     csv_label_list.append(detailLabel)
                                                                        if 'edit' in layout:
                                                                            csvdata = detailLabel.replace('.', '').replace('/', '_').replace('(s)', '').replace(' ', '_')
                                                                            csv_label_list.append(csvdata)

                                                                        detailType = detaildata['layoutComponents'][0]['details']['type']
                                                                        datalist.append(detailType)
                                                                    if kd == 'components':
                                                                        for kdata in kv:
                                                                            compLabel = kdata['details']['label']
                                                                            datalist.append(compLabel)
                                                                            # if 'edit' in layout:
                                                                            #     editlabel = '%s Edit' %compLabel
                                                                            #     csv_label_list.append(editlabel)
                                                                            # else:
                                                                            #     csv_label_list.append(compLabel)
                                                                            if 'edit' in layout:
                                                                                csvdata = compLabel.replace('.', '').replace('/', '_').replace('(s)', '').replace(' ', '_')
                                                                                csv_label_list.append(csvdata)

                                                                            compType = kdata['details']['type']
                                                                            datalist.append(compType)

                    generateXpath_detail_edit_layouts(object, header, datalist)
                    # print header

            def relListLabels(v):
                if isinstance(v, list):
                    for btns in v:
                        rlist_buttons = []
                        rlist_columns = []
                        if isinstance(btns, OrderedDict):
                            for btnlabelk, btnlabelv in btns.iteritems():
                                # rlist_buttons = []
                                # rlist_columns = []
                                if btnlabelk == 'buttons':
                                    if isinstance(btnlabelv, list):
                                        for btns in btnlabelv:
                                            if isinstance(btns, OrderedDict):
                                                for btnsk, btnsv in btns.iteritems():
                                                    if btnsk == 'label' and btnsv != '':
                                                        rlist_buttons.append(btnsv)
                                    # if len(rlist_buttons) > 0:
                                    #     print 'RL Buttons are : %s' %rlist_buttons
                                    # else:
                                    #     print 'No Buttons are available'
                                if btnlabelk == 'columns':
                                    if isinstance(btnlabelv, list):
                                        for btns in btnlabelv:
                                            if isinstance(btns, OrderedDict):
                                                for btnsk, btnsv in btns.iteritems():
                                                    if btnsk == 'label' and btnsv != '':
                                                        rlist_columns.append(btnsv)
                                    # if len(rlist_columns) > 0:
                                    #     print 'RL Columns are : %s' %rlist_columns
                                    # else:
                                    #     print 'No Columns are available'
                                if btnlabelk == 'label':
                                    global rl
                                    rl = btnlabelv
                        genearateXpath_relList_buttons(object, rl, rlist_buttons)
                        # print rl

            def btnlistLabels(v):
                if isinstance(v, list):
                    # PageBtnheader = '\n''#  %s Page Button locators'%object
                    # xpathList.append(PageBtnheader)
                    for btns in v:
                        if isinstance(btns, OrderedDict):
                            page_btn_list = []
                            for btnlabelk, btnlabelv in btns.iteritems():
                                if btnlabelk == 'label' and btnlabelv != '':
                                    page_btn_list.append(btnlabelv)
                            generateXpath_page_buttons(object, page_btn_list)

            def relatedList(buttonlayout):
                if isinstance(buttonlayout, OrderedDict):
                    for k, v in buttonlayout.iteritems():
                        btnlistLabels(v)
                elif isinstance(buttonlayout, list):
                    relListLabels(buttonlayout)

            def xpath(labels):
                if any(['edit' in layout, 'detail' in layout]):
                    DescribeLayouts(labels)
                else:
                    relatedList(labels)

            xpath(labels)
        print csv_label_list
        return xpathList, editkeywordList, detailkeywordList, pagebuttonkeyList, csv_label_list

    def get_sobjects(self, sf):
        sf.describe()
        std_object_list = []
        cust_object_list = []
        cust_object_name_list = []
        for x in sf.describe()["sobjects"]:
            if x["custom"] == True and x['layoutable'] != False:
                cust_object_list.append(x["label"])
                cust_object_name_list.append(x['name'])
            if x["custom"] == False and x['layoutable'] != False:
                std_object_list.append(x["label"])

        return std_object_list, cust_object_list, cust_object_name_list

    def get_all_tabs(self, sf, flag=None):
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
        return std_tablabelList, std_sobjectNameList, cust_tablabelList, cust_sobjectNameList

    def query_all(self, sf, query):
        sf.query_all(query)

    def search(self, sf, query):
        sf.query_all(query)

    def Click_On_Given_Text_In_RelatedList_Table(self, relatedlistsection, text, row=None):
        import logging
        # xpath for relatedlist table
        seleniuminstance = BuiltIn().get_library_instance('Selenium2Library')
        try:
            if row is None:
                xpath = "//h3[text()='%s']/following::table[1]//*[text()='%s']" % (relatedlistsection, text)
                seleniuminstance.wait_until_page_contains_element(xpath)
                seleniuminstance.capture_page_screenshot(filename='%s section' %relatedlistsection)
                logging.info(msg='Clicking on element %s' % text)
                seleniuminstance.click_element(xpath)
            else:
                row = row + 1
                xpath = "//h3[text()='%s']/following::table[1]//tr[%s]//*[text()='%s']" % (relatedlistsection, row, text)
                seleniuminstance.wait_until_page_contains_element(xpath)
                seleniuminstance.capture_page_screenshot(filename='%s section' %relatedlistsection)
                logging.info(msg='Clicking on element %s' % text)
                seleniuminstance.click_element(xpath)
        except:
            logging.error("element '%s' not found" % text)