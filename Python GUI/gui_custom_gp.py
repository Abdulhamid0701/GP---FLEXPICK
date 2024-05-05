# Main GUI for the FlexPick Project
# This Code to be called by the main python program that will call the computer vision program as well 

import customtkinter     
import tkinter.messagebox
from PIL import Image
import tkinter


customtkinter.set_appearance_mode("dark")  # Modes: "System" (standard), "Dark", "Light"
customtkinter.set_default_color_theme("blue")  # Themes: "blue" (standard), "green", "dark-blue"

app = customtkinter.CTk()
app.geometry("1000x780")
app.title("CustomTkinter simple_example.py")

sidebar_frame = customtkinter.CTkFrame(master=app, width=1000, corner_radius=5 )
sidebar_frame.grid(row=0, column=0, rowspan=4, sticky="nsew")
sidebar_frame.grid_rowconfigure(0, weight=1)
sidebar_frame.grid_columnconfigure(0, weight=1)

bottom_frame = customtkinter.CTkFrame(app, width=1000, height=200, corner_radius=5)
bottom_frame.grid(row=0, column=16, rowspan=4, sticky="nsew")
bottom_frame.place(y = 680)

logo_label = customtkinter.CTkLabel(sidebar_frame, text="FlexPick Project", font=("Poppins Medium", 30), width=1000, corner_radius=400, height=60) #text_color= "#3a7ebf")
logo_label.grid(row=0, column=0, padx=0, pady=(10, 10))

my_image_delta = customtkinter.CTkImage(dark_image=Image.open("DELTA_BLUE.png"), size=(107/1.5, 107/1.5))
my_image_soft = customtkinter.CTkImage(dark_image=Image.open("SOFT _BLUE.png"), size=(107/1.5, 98/1.5))
my_image_cv = customtkinter.CTkImage(dark_image=Image.open("CV_BLUE.png"), size=(130/1.5, 100/1.5))
my_image_cu = customtkinter.CTkImage(dark_image=Image.open("gam3a.png"), size=(200, 98))
my_image_sect = customtkinter.CTkImage(dark_image=Image.open("SECTOR.png"), size=(198, 50))
my_image_molto = customtkinter.CTkImage(dark_image=Image.open("ITIDA.png"), size=(200, 100))

navigation_frame_label = customtkinter.CTkLabel(app, image=my_image_delta, width= 10, text = "")
navigation_frame_label.grid(row=0, column=0, padx=10, pady=10)
navigation_frame_label.place(x = 320, y = 80)

navigation_frame_label = customtkinter.CTkLabel(app, image=my_image_soft, width= 10, text = "")
navigation_frame_label.grid(row=0, column=0, padx=10, pady=10)
navigation_frame_label.place(x = 450, y = 80)

navigation_frame_label = customtkinter.CTkLabel(app, image=my_image_cv, width= 10, text = "")
navigation_frame_label.grid(row=0, column=0, padx=10, pady=0)
navigation_frame_label.place(x = 590, y = 80)

navigation_frame_label = customtkinter.CTkLabel(bottom_frame, image=my_image_cu, width= 10, text = "")
navigation_frame_label.grid(row=0, column=8, padx=10, pady=0)
#navigation_frame_label.place(x = 410, y = 680)

navigation_frame_label = customtkinter.CTkLabel(bottom_frame, image=my_image_sect, width= 10, text = "")
navigation_frame_label.grid(row=0, column=0, padx=10, pady=0)
#navigation_frame_label.place(x = 170, y = 700)

navigation_frame_label = customtkinter.CTkLabel(bottom_frame, image=my_image_molto, width= 10, text = "")
navigation_frame_label.grid(row=0, column=10, padx=10, pady=0)
#navigation_frame_label.place(x = 620, y = 675)



# Computer Vision or DEMOS choice
demos_frame = customtkinter.CTkFrame(app, height=500, width=500, corner_radius = 20)
demos_frame.grid(row=1, column=3, padx=(20, 20), pady=(20, 0), sticky="nsew")
demos_frame.place(x = 45, y = 200)

cv_frame = customtkinter.CTkFrame(app, height=300, width=350, corner_radius = 20)
cv_frame.grid(row=1, column=7, padx=(20, 20), pady=(20, 0), sticky="nsew")
cv_frame.place(x = 590, y = 200)

Home_frame = customtkinter.CTkFrame(app, height=300, width=350, corner_radius = 20)
Home_frame.grid(row=1, column=7, padx=(20, 20), pady=(20, 0), sticky="nsew")
Home_frame.place(x = 380, y = 200)

def switch_event():
    print("switch toggled, current value:", switch_var.get())

demos_sw = customtkinter.StringVar(value="on")
demossw = customtkinter.CTkSwitch(demos_frame, text="Delta Robot Demos Motion", command=switch_event, variable=demos_sw, onvalue="on", offvalue="off", switch_height= 30, switch_width=60, font=('Poppins',18))
demossw.grid(row = 0, column = 0, padx=10, pady=(20, 0))

switch_var = customtkinter.StringVar(value="on")
switch = customtkinter.CTkSwitch(cv_frame, text="Computer Vision Controlled Motion", command=switch_event, variable=switch_var, onvalue="on", offvalue="off", switch_height= 30, switch_width=60, font=('Poppins',18))
switch.grid(row = 0, column = 0, padx=10, pady=(20, 20))

home_var = customtkinter.StringVar(value="on")
home_switch = customtkinter.CTkSwitch(Home_frame, text="Home Robot", command=switch_event, variable=home_var, onvalue="on", offvalue="off", switch_height= 30, switch_width=60, font=('Poppins',18))
home_switch.grid(row = 0, column = 0, padx=10, pady=(20, 20))

def checkbox_event():
    print("checkbox toggled, current value:", check_var.get())

check_var = customtkinter.StringVar(value="on")
checkbox = customtkinter.CTkCheckBox(master = demos_frame, text="NonStop", command=checkbox_event, variable=check_var, onvalue="on", offvalue="off")
checkbox.grid(row=1, column=0, pady=(20, 0), padx=0, sticky="n")

check_var = customtkinter.StringVar(value="on")
checkbox = customtkinter.CTkCheckBox(demos_frame, text="One Cycle Only", command=checkbox_event, variable=check_var, onvalue="on", offvalue="off")
checkbox.grid(row=2, column=0, pady=(20, 0), padx=0, sticky="n")

#Switches Default Startup Values 
demossw.deselect()
home_switch.select()
switch.deselect()

app.mainloop()