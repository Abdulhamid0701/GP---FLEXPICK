# Main GUI for the FlexPick Project
# This Code to be called by the main python program that will call the computer vision program as well 

import serial
import customtkinter     
import tkinter.messagebox
from PIL import Image
import tkinter
import time

byte_sent: str
byte_sent = "none"


##################################################################################################################################################################
# Serial Monitor Init.
ser = serial.Serial('COM9', 9600)
##################################################################################################################################################################

##################################################################################################################################################################
def send_byte(whats_sent: str):
    global byte_sent

    ser.write((whats_sent).encode())
    print("sending: ", whats_sent)

def change_appearance_mode_event(new_appearance_mode: str):
    customtkinter.set_appearance_mode(new_appearance_mode)

def checkbox_event_nonstop():
    print("checkbox toggled, current value:", check_nonstop.get())
    checkbox_onetime.deselect()
    if check_nonstop.get() == "on":
        send_byte("DEMONONSTOP")
    else:
        send_byte("DEMOSTOPNOW")
    #ser.write(bytes('DEMO_INF', 'UTF-8'))
    
def checkbox_event_onetime():
    print("checkbox toggled, current value:", check_onetime.get())
    checkbox_nonstop.deselect()
    if check_onetime.get() == "on":
        send_byte("DEMOONETIME")
    #ser.write(bytes('DEMO_ONCE', 'UTF-8'))
    
def switch_event_home():
    global byte_sent
    print("switch toggled, current value:", switch_var_home.get())
    demossw.deselect()
    switch.deselect()
    byte_sent = "HOME"
    #ser.write(bytes('H', 'UTF-8'))
    send_byte("HOME")

def switch_event_demos():
    print("switch toggled, current value:", switch_var_demos.get())
    switch.deselect()
    home_switch.deselect()
    send_byte("DEMOS")
    #ser.write(bytes('DEMOS_ON', 'UTF-8'))
    
def switch_event_cv():
    print("switch toggled, current value:", switch_var_cv.get())
    home_switch.deselect()
    demossw.deselect()
    send_byte("VISION")

def demos_optioN_event(new_scaling: str):
    out_opt: str
    if new_scaling == "Cornering Demo":
        out_opt = "CORNER"
    elif new_scaling == "Pick & Place Demo":
        out_opt = "PICKPLACE"
    elif new_scaling == "Circular Demo":
        out_opt = "circ"
    elif new_scaling == "Z-Only Demo":
        out_opt = "zonly"
    
    send_byte(out_opt)
    #ser.write(bytes(out_opt, 'UTF-8'))
    #print("Demos Option:", out_opt)
    
def switch_event_belt():
    print("Belt", switch_var_belt.get())
    ah = ser.read()
    print("ah", ah)
    
def switch_event_pnu():
    print("Pneumatic", switch_var_pnu.get())
##################################################################################################################################################################    

time.sleep(3)

#---------------------------------------------------------------------------------------------------------------------------------------------------------------~#    
#print("BYTE_SENT:", byte_sent)    
    
customtkinter.set_appearance_mode("light")  # Modes: "System" (standard), "Dark", "Light"
customtkinter.set_default_color_theme("blue")  # Themes: "blue" (standard), "green", "dark-blue"

app = customtkinter.CTk()
app.geometry("1000x780")
app.title("CustomTkinter simple_example.py")

sidebar_frame = customtkinter.CTkFrame(master=app, width=1000, corner_radius=5 )
sidebar_frame.grid(row=0, column=0, rowspan=4, sticky="nsew")
sidebar_frame.grid_rowconfigure(0, weight=1)
sidebar_frame.grid_columnconfigure(0, weight=1)

bottom_frame = customtkinter.CTkFrame(master = app, width=1000, height=200, corner_radius=20)
bottom_frame.grid(row=0, column=4, rowspan=4, columnspan = 4, sticky="nsew", padx = 100)
bottom_frame.grid_rowconfigure(1, weight=1)
bottom_frame.place(y = 680, x = 0)

logo_label = customtkinter.CTkLabel(sidebar_frame, text="FlexPick Project", font=("Poppins Medium", 33), width=1000, corner_radius=400, height=60) #text_color= "#3a7ebf")
logo_label.grid(row=0, column=0, padx=0, pady=(10, 10))

##################################################################################################################################################################
my_image_delta = customtkinter.CTkImage(dark_image=Image.open("DELTA_BLUEE.png"), size=(107/1.5, 107/1.5))
my_image_soft  = customtkinter.CTkImage(dark_image=Image.open("SOFT_BLUEE.png"), size=(107/1.5, 98/1.5))
my_image_cv    = customtkinter.CTkImage(dark_image=Image.open("CV_BLUEE.png"),    size=(130/1.5, 100/1.5))
my_image_cu    = customtkinter.CTkImage(dark_image=Image.open("gam3a.png"),      size=(200, 98))
my_image_sect  = customtkinter.CTkImage(dark_image=Image.open("SECTOR.png"),     size=(198, 50))
my_image_molto = customtkinter.CTkImage(dark_image=Image.open("ITIDA.png"),      size=(200, 100))

navigation_frame_label_d = customtkinter.CTkLabel(app, image=my_image_delta, width= 10, text = "")
navigation_frame_label_d.grid(row=0, column=0, padx=10, pady=10)
navigation_frame_label_d.place(x = 320, y = 80)

navigation_frame_label_s = customtkinter.CTkLabel(app, image=my_image_soft, width= 10, text = "")
navigation_frame_label_s.grid(row=0, column=0, padx=10, pady=10)
navigation_frame_label_s.place(x = 450, y = 80)

navigation_frame_label_c = customtkinter.CTkLabel(app, image=my_image_cv, width= 10, text = "")
navigation_frame_label_c.grid(row=0, column=0, padx=10, pady=0)
navigation_frame_label_c.place(x = 590, y = 80)

navigation_frame_label_cu = customtkinter.CTkLabel(bottom_frame, image=my_image_cu, width= 100, text = "")
navigation_frame_label_cu.grid(row=0, column=2, padx=(10,10), pady=0)
#navigation_frame_label_cu.place(x = 410, y = 680)

navigation_frame_label_sect = customtkinter.CTkLabel(bottom_frame, image=my_image_sect, width= 10, text = "", compound ="right")
navigation_frame_label_sect.grid(row=0, column=1, padx=(180,10), pady=0)
#navigation_frame_label_sect.place(x = 170, y = 700)

navigation_frame_label = customtkinter.CTkLabel(bottom_frame, image=my_image_molto, width= 100, text = "")
navigation_frame_label.grid(row=0, column=3, padx=(10,300), pady=0)
#navigation_frame_label.place(x = 620, y = 675)
##################################################################################################################################################################

##################################################################################################################################################################
# Computer Vision or DEMOS choice
demos_frame = customtkinter.CTkFrame(app, height=500, width=500, corner_radius = 20)
demos_frame.grid(row=1, column=3, padx=(20, 200), pady=(20, 0), sticky="nsew", columnspan = 4)
demos_frame.place(x =45, y = 200)

cv_frame = customtkinter.CTkFrame(app, height=300, width=350, corner_radius = 20)
cv_frame.grid(row=1, column=7, padx=(20, 20), pady=(20, 0), sticky="nsew")
cv_frame.place(x = 590, y = 200)

Home_frame = customtkinter.CTkFrame(app, height=300, width=350, corner_radius = 20)
Home_frame.grid(row=1, column=7, padx=(20, 20), pady=(20, 0), sticky="nsew")
Home_frame.place(x = 380, y = 200)

switch_var_demos = customtkinter.StringVar(value="on")
demossw = customtkinter.CTkSwitch(demos_frame, text="Delta Robot Demos Motion", command=switch_event_demos, variable=switch_var_demos, onvalue="on", offvalue="off", switch_height= 30, switch_width=60, font=('Poppins',18), width=100)
demossw.grid(row = 0, column = 0, padx=10, pady=(20, 0))

switch_var_cv = customtkinter.StringVar(value="on")
switch = customtkinter.CTkSwitch(cv_frame, text="Computer Vision Controlled Motion", command=switch_event_cv, variable=switch_var_cv, onvalue="on", offvalue="off", switch_height= 30, switch_width=60, font=('Poppins',18))
switch.grid(row = 0, column = 0, padx=10, pady=(20, 20))

switch_var_home = customtkinter.StringVar(value="on")
home_switch = customtkinter.CTkSwitch(Home_frame, text="Home Robot", command=switch_event_home, variable=switch_var_home, onvalue="on", offvalue="off", switch_height= 30, switch_width=60, font=('Poppins',18))
home_switch.grid(row = 0, column = 0, padx=10, pady=(20, 20))

check_nonstop = customtkinter.StringVar(value="on")
checkbox_nonstop = customtkinter.CTkCheckBox(master = demos_frame, text="NonStop", command=checkbox_event_nonstop, variable=check_nonstop, onvalue="on", offvalue="off",  font=('Poppins Medium',12))
checkbox_nonstop.grid(row=2, column=0, pady=(12, 5), padx=(170,20), sticky="w")

check_onetime = customtkinter.StringVar(value="on")
checkbox_onetime = customtkinter.CTkCheckBox(demos_frame, text="One Cycle Only", command=checkbox_event_onetime, variable=check_onetime, onvalue="on", offvalue="off",  font=('Poppins Medium',12))
checkbox_onetime.grid(row=1, column=0, pady=(12, 5), padx=(170,20), sticky="w")

demos_optionemenu = customtkinter.CTkOptionMenu(demos_frame, values=["Cornering Demo", "Pick & Place Demo", "Z-Only Demo", "Circular Demo"], font=('Poppins Medium',12), command=demos_optioN_event)
demos_optionemenu.grid(row=1, column=0, padx=(15,8), pady=(12, 5), sticky = "w")
##################################################################################################################################################################

##################################################################################################################################################################
# System Switches 
sys_frame = customtkinter.CTkFrame(app, height=280, width=400, corner_radius = 20)
sys_frame.grid(row=1, column=3, padx=(20, 20), pady=(20, 0), sticky="nsew")
sys_frame.place(x = 45, y =350)
label_radio_group = customtkinter.CTkLabel(master=sys_frame, text="System Switches", font=('Poppins',18), width=100, corner_radius=20)
label_radio_group.grid(row=0, column=0, columnspan=4, padx=0, pady=10, sticky="")

switch_var_belt = customtkinter.StringVar(value="off")
switch_belt = customtkinter.CTkSwitch(master = sys_frame, text = "Conveyor Belt", font = ('Poppins', 16), command=switch_event_belt, variable=switch_var_belt, onvalue="on", offvalue="off")
switch_belt.grid(row = 1, column = 0, padx=(35,0), pady=(4, 4))

switch_var_pnu = customtkinter.StringVar(value="off")
switch_pnu = customtkinter.CTkSwitch(master = sys_frame, text = "Pneumatic Unit", font = ('Poppins', 16), command=switch_event_pnu, variable=switch_var_pnu, onvalue="on", offvalue="off")
switch_pnu.grid(row = 1, column = 1, padx=(20,20), pady=(10, 10))
##################################################################################################################################################################


# System Readings (Sensors & Monitoring)
#read_frame = customtkinter.CTkFrame(app, height=280, width=400, corner_radius = 20)
#read_frame.grid(row=1, column=3, padx=(20, 20), pady=(20, 0), sticky="nsew")
#read_frame.place(x = 590, y =500)

# COMPUTER VISION CONTROLLED PROGRAM, User side responsible for selecting an order 
user_frame = customtkinter.CTkFrame(app, height=300, width=350, corner_radius = 20)
user_frame.grid(row=1, column=3, padx=(20, 20), pady=(20, 0), sticky="nsew", columnspan = 7)
user_frame.place(x = 580, y =300)

user_label = customtkinter.CTkLabel(master=user_frame, text="User Package Selection", font=('Poppins',19), width=100, corner_radius=20)
user_label.grid(row=0, column=0, columnspan=4, padx=(50,50), pady=10, sticky="w")

checkbox_apples = customtkinter.CTkCheckBox(master = user_frame, text="Apples",  font=('Poppins Medium',14))
checkbox_apples.grid(row=2, column=0, pady=(12, 5), padx=(20,20), sticky="w")

apples_optionemenu = customtkinter.CTkOptionMenu(user_frame, values=["1", "2", "3", "4"], font=('Poppins Medium',12))
apples_optionemenu.grid(row=2, column=1, padx=(50,0), pady=(12, 5), sticky = "w")
apples_qty_label = customtkinter.CTkLabel(user_frame, text="QTY", anchor="n", font=('Poppins Medium',15))
apples_qty_label.grid(row=2, column=1, padx=(0,160), pady=(7, 0))

checkbox_oranges = customtkinter.CTkCheckBox(master = user_frame, text="Oranges", offvalue="off",  font=('Poppins Medium',14))
checkbox_oranges.grid(row=3, column=0, pady=(12, 5), padx=(20,20), sticky="w")

checkbox_bannanas = customtkinter.CTkCheckBox(master = user_frame, text="Bannanas",  font=('Poppins Medium',14))
checkbox_bannanas.grid(row=4, column=0, pady=(12, 5), padx=(20,20), sticky="w")

##################################################################################################################################################################
#Switches Default Startup Values 
demossw.deselect()
home_switch.select()
switch.deselect()
checkbox_onetime.deselect()
checkbox_nonstop.deselect()
switch_belt.deselect()
switch_pnu.deselect()
##################################################################################################################################################################

##################################################################################################################################################################
# Computer Vision Controlled : User Selected Package 
##################################################################################################################################################################

#appearance_mode_label = customtkinter.CTkLabel(sidebar_frame, text="Appearance Mode:", anchor="w")
#appearance_mode_label.grid(row=0, column=1, padx=0, pady=(10, 0))
appearance_mode_optionemenu = customtkinter.CTkOptionMenu(sidebar_frame, values=["Light", "Dark", "System"], command=change_appearance_mode_event, font=('Poppins Medium',13))
appearance_mode_optionemenu.grid(row=0, column=0, padx=(850,0), pady=(10, 10))


  
app.mainloop()
print("BYTE_SENT:", byte_sent)  
ser.close()