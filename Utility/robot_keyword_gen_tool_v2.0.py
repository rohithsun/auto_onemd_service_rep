from Tkinter import *
from simple_salesforce import Salesforce
from keyword_generator import keyword_generator
from robot.libraries.OperatingSystem import OperatingSystem
import getaccesstoken

# Clasic version of SFDC
# test_url = "https://fsr--sitsupport.cs21.my.salesforce.com"
# token_url = "https://fsr--sitsupport.cs21.my.salesforce.com/services/oauth2/token"
# user = "mdevaraj@jjfsr.com.sitsupport"
# password = "Start12345"
client_id = "3MVG9zZht._ZaMuleWyBwoaXFNKvz0OtWF3of9z.Y3Nw2Cuq5Uvq2C2CK4_bTo2ddNxz6M_dgCzx6_Bdbg3f5"
client_secret = "8630955411108775183"

# Lighting version of SFDC
# test_url = "https://ap1.salesforce.com"
# token_url = "https://ap1.salesforce.com/services/oauth2/token"
# user = "pnprashanth@gmail.com"
# password = "cts@2011ljNDUXxOcnClC6ZmaXCY9EPbF"
# client_id = "3MVG9Y6d_Btp4xp4u3y.zHPd4x4wh9dpgWP27sbhoel_OCaL32tZjsUISzGz6Dcv0n40jbA32ry9Nin4xl8gz"
# client_secret = "766800130765412309"

# Lighting version of SFDC
# test_url = "https://ap5.salesforce.com"
# token_url = "https://ap1.salesforce.com/services/oauth2/token"
# user = "rohithsun@cts.com"
# password = "Panda@123WGOeZzb8dIBS23ouDwi67pqT"
# client_id = '3MVG9d8..z.hDcPIlLq.s4DoAPiNHB0IoaqTS6gtJznRo5IV8zctdYfvosXlFY6I7ANmJ4AXPXNGQLKa80vUO'
# client_secret = "2391836052489871744"

win = Tk()
win.configure(background='sky blue')
var = IntVar()
win.title("Salesforce Accelerator Tool")
win.geometry("650x650")
win.resizable(width=TRUE , height=TRUE)

variable1 = StringVar(win)
variable1.set("None")
variable2 = StringVar(win)
variable2.set("None")

Standard_Objects_Radio_Button = None
Custom_Objects_Radio_Button = None
Standard_objects_List = None
Custom_Objects_List = None
Success_Msg = None
File_Success_Msg = None
Writeto_file_Radio_Btn = None
SQL_Query_Radio_Btn = None
# Writeto_file_Radio_Btn=None
Generate_BTN = None
Execute_Btn = None
SQL_Query_input = None
Writeto_file_Radio_input = None
cust_name_dict = {}
xpath_Creation_Btn = None
DB_Testting_Btn = None
MSuccess_Msg =None
Standard_Objects_dropdown = None
Custom_Objects_dropdown = None


def Connect():
    for widget in center_frame.winfo_children():
        widget.destroy()
    for widget in bottom_frame.winfo_children():
        widget.destroy()
    Success_Msg = Message(center_frame, text="connection status", width=180)
    #
    # Success_Msg.grid(row=0, column=1)


       # Connect()

    URl = Token_URL_input.get() + "/services/oauth2/token"
    status = getaccesstoken.statuscode(URl, client_id, client_secret,
                                       Username_input.get(), Password_input.get())
    session_id = getaccesstoken.getAccesstoken(URl, client_id, client_secret, Username_input.get(),
                                               Password_input.get())
    global sf

    test_url = Token_URL_input.get()


    print("Connecting ...")

    if status == 200 and session_id is not None:
        Success_Msg.configure(text="Connection successful", fg='white', bg='sky blue')
        Success_Msg.place(in_=center_frame, anchor="c", relx=.5, rely=.5)
        refresh_btn['state'] = NORMAL
        sf = Salesforce(instance_url=test_url, session_id=session_id, sandbox=True)
        xpath_Creation_Btn = Button(top_frame, text="Generate Keyword For Tab", fg="black", bg="light blue", command=Xpath_Creation)
        xpath_Creation_Btn.grid(row=6, column=1, pady=10)
        DB_Testting_Btn = Button(top_frame, text="Query For Records", fg="black", bg="light blue", command=DB_Testing)
        DB_Testting_Btn.grid(row=6, column=3, pady=10)
        print("Connected!!")
    # Success_Msg.grid_remove()
    else:
        Success_Msg.configure(text="INVALID_LOGIN: Invalid username, password, security token; or user locked out", bg='sky blue', fg='red')
        Success_Msg.place(in_=center_frame, anchor="c", relx=.5, rely=.5)
        refresh_btn['state'] = DISABLED
        #Retry_btn = Button(center_frame, text="Retry", fg="white", bg="light blue", command=msg_delete)


Query_input = None
sc = 0


def DB_Testing():
    for widget in center_frame.winfo_children():
        widget.destroy()
    languages = [
        "Query All",
        "Search",
    ]

    def ShowChoice():
        global sc
        sc = var.get()
        print sc

    Label(center_frame, bg='sky blue',
          text="""Salesforce DB Testing""",
          justify=LEFT,
          padx=20).grid(row=1, column=2)

    for val, language in enumerate(languages):
        Radiobutton(center_frame, bg='sky blue',
                    text=language,
                    padx=20,
                    variable=var,
                    command=ShowChoice,
                    value=val).grid(row=2, column=val+1)

    Query_input_label = Label(center_frame, bg='sky blue',text="Input Query")
    global Query_input
    Query_input = Entry(center_frame)

    Query_input_label.grid(row=4, column=1)
    Query_input.grid(row=4, column=2)
    Execute_Btn = Button(center_frame, text="Query", fg="black", bg="sky blue", command=query)
    Execute_Btn.grid(row=5, column=2,columnspan=2)


def query():
    if (sc == 0):
        q = keyword_generator()
        queryalldata = q.query_all(sf, Query_input.get())
        Success_Msg.configure(text=queryalldata)
        Success_Msg.grid(row=0, column=1)
    else:
        q = keyword_generator()
        searchdata = q.search(sf, Query_input.get())
        Success_Msg.configure(text=searchdata)
        Success_Msg.grid(row=0, column=1)


def Xpath_Creation():
    for widget in center_frame.winfo_children():
        widget.destroy()
    global Standard_Objects_Radio_Button, Custom_Objects_Radio_Button, Generate_BTN

    xp = keyword_generator()
    Standard_objects_List, std_object_name_list, Custom_Objects_List, cust_object_name_list = xp.get_all_tabs(sf)

    Generate_BTN = Button(center_frame, text="Generate Keyword File", fg="black", bg="light blue", command=generate_Xpath_CSS)

    Generate_BTN.grid(row=6, column=2)
    Generate_BTN['state'] = DISABLED

    global cust_name_dict, std_name_dict

    if Standard_objects_List is not None:
        creatmenu_std(Standard_objects_List)
        std_name_dict = dict(zip(Standard_objects_List, std_object_name_list))
        Standard_Objects_Radio_Button = Radiobutton(center_frame, bg='sky blue', text="Select Tab (Standard)",
                                                    variable=var, value=1,
                                                    command=Standard_Enable, fg='black')
        Standard_Objects_Radio_Button.grid(row=3, column=2)
        Standard_Objects_Radio_Button['state'] = NORMAL
        Standard_Objects_dropdown['state'] = NORMAL

    if len(Custom_Objects_List) > 0:
        creatmenu_cust(Custom_Objects_List)
        cust_name_dict = dict(zip(Custom_Objects_List, cust_object_name_list))
        Custom_Objects_Radio_Button = Radiobutton(center_frame, bg='sky blue', text="Select Tab (Custom)", variable=var,
                                                  value=2, command=Custom_Enable, fg='black')
        Custom_Objects_Radio_Button.grid(row=4, column=2)
        Custom_Objects_Radio_Button['state'] = NORMAL
        Custom_Objects_dropdown['state'] = NORMAL
    else:
        No_CustomObj_Msg = Message(center_frame, text="No Custom Objects are available", fg='white', bg='sky blue')
        No_CustomObj_Msg.grid(row=4, column=3)

def Standard_Enable():
    if Custom_Objects_dropdown is not None:
        Custom_Objects_Radio_Button['state'] = DISABLED
        Custom_Objects_dropdown['state'] = DISABLED
    Generate_BTN['state'] = NORMAL


def Custom_Enable():
    Standard_Objects_Radio_Button['state'] = DISABLED
    Standard_Objects_dropdown['state'] = DISABLED
    Generate_BTN['state'] = NORMAL


def refresh():
    variable1.set("None")
    variable2.set("None")
    for widget in center_frame.winfo_children():
        widget.destroy()
    for widget in bottom_frame.winfo_children():
        widget.destroy()
    # Standard_Objects_Radio_Button['state'] = NORMAL
    # Custom_Objects_Radio_Button['state'] = NORMAL
    # Standard_Objects_dropdown['state'] = NORMAL
    # Custom_Objects_dropdown['state'] = NORMAL

def generate_Xpath_CSS():
    if Standard_Objects_dropdown['state'] == NORMAL:
        obj = variable1.get()
        object = std_name_dict[obj]
    else:
        obj = variable2.get()
        object = cust_name_dict[obj]

    # error_Msg = None
    try:
        gen = keyword_generator()
        global xpath_values, editkeywords, detailkeywords, pagebuttonkeyList, csv_label_list
        xpath_values, editkeywords, detailkeywords, pagebuttonkeyList, csv_label_list  = gen.generateXpath(object, sf)
        writeToFile_Settings(object, obj)
    except:
        error_Msg = Message(bottom_frame, text='Resource %s NOT FOUND' % object, bg='sky blue', fg='red', width=90)
        error_Msg.place(in_=bottom_frame, anchor="c", relx=.5, rely=.5)

def writeToFile_Settings(object, obj):
    global OS, path
    OS = OperatingSystem()
    path = '../Resources/MedvantageApp/PO/%s_Page.robot' %object
    OS.create_file(path, '*** Settings ***')
    print 'Printing Settings ....'
    OS.append_to_file(path, '\n')
    OS.append_to_file(path, 'Documentation    %s Page Reusable Keywords' %object)
    OS.append_to_file(path, '\n')
    OS.append_to_file(path, 'Library  Selenium2Library')
    OS.append_to_file(path, '\n')
    OS.append_to_file(path, 'Library  OperatingSystem')
    OS.append_to_file(path, '\n')
    OS.append_to_file(path, 'Library  ../../../Utility/keyword_generator.py')
    OS.append_to_file(path, '\n')
    OS.append_to_file(path, 'Resource  ../../commonn-methods.robot')
    OS.append_to_file(path, '\n')
    OS.append_to_file(path, 'Library  ../../../Utility/NameDatetime.py')
    OS.append_to_file(path, '\n')
    OS.append_to_file(path, '\n')
    writeToFile_variables(object, obj)

def writeToFile_variables(object, obj):
    # MSuccess_Msg = Message(bottom_frame, text='Printing file ....')
    # def Error_Delete():
    #     error_Msg.destroy()
    #     Try_with_Other_object_btn.destroy()
        # Try_with_Other_object_btn = Button(bottom_frame, text="Try_with_Other_object", fg="black", bg="light blue",
        #                                     command=Error_Delete)
        # Try_with_Other_object_btn.grid(row=2, column=2)

    OS = OperatingSystem()
    # path = '../Resources/MedvantageApp/PageElements/%s_Page.robot' % object
    OS.append_to_file(path, '*** Variables ***')
    OS.append_to_file(path, '\n')

    # MSuccess_Msg.grid(row=0, column=1)
    print 'Printing file ....'
    OS.append_to_file(path, '\n''# Locators for All Tabs')
    OS.append_to_file(path, '\n''${Alltabs_btn_loc}  //img[@title=\'All Tabs\']')
    OS.append_to_file(path, '\n''${%s_tab_link_loc}  //img[@title=\'%s\']'%(object,obj))
    OS.append_to_file(path, '\n')
    try:
        for xpathdata in xpath_values:
            OS.append_to_file(path, xpathdata)
            OS.append_to_file(path, '\n')
    except:
        print "No Object"

    writeToFile_keywords(object, obj)

def writeToFile_keywords(object, obj):
    OS.append_to_file(path, '\n')
    OS.append_to_file(path, '*** Keywords ***')
    OS.append_to_file(path, '\n')
    print 'printing keywords ...'
    # to write Keywords for edit layout
    for editkeydata in editkeywords:
        OS.append_to_file(path, editkeydata)
        OS.append_to_file(path, '\n')

    OS.append_to_file(path, '\n')
    # to write Keywords for detail layout
    for detailkeydata in detailkeywords:
        OS.append_to_file(path, detailkeydata)
        OS.append_to_file(path, '\n')

    # to write keywords for page buttons
    for pagebtndata in pagebuttonkeyList:
        OS.append_to_file(path, pagebtndata)
        OS.append_to_file(path, '\n')

    # keywords to navigate to all tabs and then respective tab
    OS.append_to_file(path, '\n''# Keyword to navigate to %s Tab from AllTabs Page'%object)
    OS.append_to_file(path, '\n''%sPage.Click On %s Tab'%(object,object))
    OS.append_to_file(path, '\n''    click image  ${Alltabs_btn_loc}')
    OS.append_to_file(path, '\n''    wait until page contains element  ${%s_tab_link_loc}'%object)
    OS.append_to_file(path, '\n''    click image  ${%s_tab_link_loc}'%object)

    # keywords to click new button if any
    OS.append_to_file(path, '\n')
    OS.append_to_file(path, '\n''# keywords to click new button from %s Page'%object)
    OS.append_to_file(path, '\n''%sPage.Click On New Button'%object)
    OS.append_to_file(path, '\n''    click button  //td[@class=\'pbButton\']//input[@title=\'New\']')

    # keywords to verify record created
    OS.append_to_file(path, '\n')
    OS.append_to_file(path, '\n''# keywords to verify %s record created'%object)
    OS.append_to_file(path, '\n''%sPage.Verify if %s is saved successfully'%(object,object))
    OS.append_to_file(path, '\n''    wait until page contains element  //h2[contains(text(), \'Detail\')]')
    OS.append_to_file(path, '\n''    element should be visible  //h2[contains(text(), \'Detail\')]')
    OS.append_to_file(path, '\n''    Selenium2library.capture page screenshot  %sscreen.png' % object)

    # keywords to click record in a related list section
    OS.append_to_file(path, '\n')
    OS.append_to_file(path, '\n''# keywords to click record in a related list section')
    OS.append_to_file(path, '\n''%sPage.Click On Given Text In RelatedList Table'%object)
    OS.append_to_file(path, '\n''    [Arguments]  ${section}  ${text}  ${row}')
    OS.append_to_file(path, '\n''    Click On Given Text In RelatedList Table  ${section}  ${text}  ${row}')

    writeToFile_CSV_testdata(object, obj)

def writeToFile_CSV_testdata(object, obj):
    for widget in bottom_frame.winfo_children():
        widget.destroy()
    OS.create_file('../Data/%s_test_data.csv'%object)
    # to write test data labels to csv
    print 'Creating CSV test data file ...'
    OS.append_to_file('../Data/%s_test_data.csv' % object, 'Profile,Username,Password'),
    for labeldata in csv_label_list:
        OS.append_to_file('../Data/%s_test_data.csv'%object, ','+labeldata),

    File_Success_Msg = Message(bottom_frame, text="Keyword File For '%s' created!!"%obj, fg='white', bg='sky blue')
    File_Success_Msg.place(in_=bottom_frame, anchor="c", relx=.5, rely=.5)

##############################################################################################
# Frame Setup
top_frame = Frame(win, highlightbackground="white", highlightcolor="white", highlightthickness=1, bg='sky blue', width=450, height=50, bd=0)
center_frame = Frame(win, highlightbackground="white", highlightcolor="white", highlightthickness=1, bg='sky blue', width=450, height=50, bd=0)
bottom_frame = Frame(win, highlightbackground="sky blue", highlightcolor="blue", highlightthickness=1, bg='sky blue', width=450, height=50, bd=0)

# layout all of the main containers
#root.grid_rowconfigure(1, weight=1)
#root.grid_columnconfigure(0, weight=1)

# create the widgets for the top frame
#b1 = Button(center_frame,text='Generate xpath',command=Xpath_Creation)
#b2 = Button(center_frame,text='Database',command=DB_Testing)

################################################################################################
# Oauth2 Session
Title_label = Label(top_frame, text="Salesforce Keyword Accelerator v1.0", fg="white", bg='sky blue')
Token_URL_label = Label(top_frame, text="Test URL", fg='black', bg='sky blue')
Username_label = Label(top_frame, text="Username", fg='black', bg='sky blue')
Password_label = Label(top_frame, text="Password", fg='black', bg='sky blue')
Client_Id_label = Label(top_frame, text="Client Id", fg='black', bg='sky blue')
Client_secret_key_label = Label(top_frame, text="Client Secret Key", fg='black', bg='sky blue')

# To Place Salesforce logo to the window
photo = PhotoImage(file = "../Resources/Salesforce-Logo.gif")
label = Label(top_frame, image = photo)
label.image = photo # keep a reference!
label.grid(row=0,column=3)

################################################################################################
#frame alignments
# top_frame.place(anchor="c", relx=.5, rely=.5)
# center_frame.grid(row=1, sticky="ew")
# bottom_frame.grid(row=2, sticky="ew")

top_frame.pack(fill="both", expand=True, padx=20, pady=20)
center_frame.pack(fill="both", expand=True, padx=20)
bottom_frame.pack(fill="both", expand=True, padx=20, pady=20)

# f1.pack(fill="both", expand=True, padx=20, pady=20)
# f2.place(in_=f1, anchor="c", relx=.5, rely=.5)
# layout the widgets in the top frame
#b1.grid(row=1,column=1,columnspan=2)
#b2.grid(row=1,column=3,columnspan=2,sticky=E)

################################################################################################
Token_URL_input = Entry(top_frame)
Username_input = Entry(top_frame)
Password_input = Entry(top_frame)
Client_Id_input = Entry(top_frame)
Client_secret_key_input = Entry(top_frame)

Title_label.grid(row=0)
Token_URL_label.grid(row=1, column=1)
Token_URL_input.grid(row=1, column=2)
Username_label.grid(row=2, column=1)
Username_input.grid(row=2, column=2)
Password_label.grid(row=3, column=1)
Password_input.grid(row=3, column=2)
Password_input.config(show="*")
# Client_Id_label.grid(row=4, sticky=E)
# Client_Id_input.grid(row=4, column=1)
# Client_secret_key_label.grid(row=5, sticky=E)
# Client_secret_key_input.grid(row=5, column=1)
connect_btn = Button(top_frame, text="Connect", fg="black", bg="light blue", command=Connect)
refresh_btn = Button(top_frame, text="Reset Options", fg="black", bg="light blue", command=refresh)
refresh_btn['state'] = DISABLED


def creatmenu_std(Standard_objects_List):
    global Standard_Objects_dropdown
    Standard_Objects_dropdown = OptionMenu(center_frame, variable1, *Standard_objects_List)
    Standard_Objects_dropdown.grid(row=3, column=3)

def creatmenu_cust(Custom_Objects_List):
    global Custom_Objects_dropdown, No_CustomObj_Msg
    Custom_Objects_dropdown = OptionMenu(center_frame, variable2, *Custom_Objects_List)
    Custom_Objects_dropdown.grid(row=4, column=3)


# Standard_Objects_dropdown['state'] = DISABLED

# Custom_Objects_dropdown['state'] = DISABLED


Title_label.grid(columnspan=2)
connect_btn.grid(row=4, column=1,columnspan=2)
refresh_btn.grid(row=4, column=3, columnspan=2)

win.mainloop()
