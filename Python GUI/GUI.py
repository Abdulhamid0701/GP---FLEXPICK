import serial
import time
import tkinter
from PIL import Image, ImageTk
from tkinter import Tk, Canvas, NW


def quit():
    global tkTop
    tkTop.destroy()

def set_button1_state():
    global b
    b += 1
    varLabel.set("Cornering DEMO ON")
    varLabel2.set(b)
    print(b)

def set_button2_state():
    varLabel.set("Pick and Place DEMO ON")


# Init Window 
tkTop = tkinter.Tk()
tkTop.geometry('1000x800')
tkTop.title("GP-GUI")

# Create a frame for the title with gray background
title_frame = tkinter.Frame(tkTop, bg='black')
title_frame.pack(fill='x')
label_title = tkinter.Label(title_frame, text='FlexPick', font=("Poppins Medium", 25), fg='white', bg='black')
label_title.pack()
label_subtitle = tkinter.Label(title_frame, text='Akwa Pick & Place Robot', font=("Poppins", 15), fg='white', bg='black')
label_subtitle.pack()

#########################################################################
# Images next to title
image1 = Image.open("DELTA.png")
image1 = image1.resize((100, 100))  # Resize the image if needed
photo1 = ImageTk.PhotoImage(image1)
label_image1 = tkinter.Label(tkTop, image=photo1, bg="black")
label_image1.image = photo1
label_image1.place(x = 20, y= 5)

image1 = Image.open("SOFT.png")
image1 = image1.resize((107, 98))  # Resize the image if needed
photo1 = ImageTk.PhotoImage(image1)
label_image1 = tkinter.Label(tkTop, image=photo1, bg="black")
label_image1.image = photo1
label_image1.place(x = 120, y= 5)

image1 = Image.open("CV.png")
image1 = image1.resize((130, 100))  # Resize the image if needed
photo1 = ImageTk.PhotoImage(image1)
label_image1 = tkinter.Label(tkTop, image=photo1, bg="black")
label_image1.image = photo1
label_image1.place(x = 225, y= 5)

image1 = Image.open("gam3a.png")
image1 = image1.resize((200, 98))  # Resize the image if needed
photo1 = ImageTk.PhotoImage(image1)
label_image1 = tkinter.Label(tkTop, image=photo1)
label_image1.image = photo1
label_image1.place(x = 390, y= 680)

image1 = Image.open("SECTOR.png")
image1 = image1.resize((198, 50))  # Resize the image if needed
photo1 = ImageTk.PhotoImage(image1)
label_image1 = tkinter.Label(tkTop, image=photo1)
label_image1.image = photo1
label_image1.place(x = 170, y= 700)

image1 = Image.open("ITIDA.png")
image1 = image1.resize((200, 100))  # Resize the image if needed
photo1 = ImageTk.PhotoImage(image1)
label_image1 = tkinter.Label(tkTop, image=photo1)
label_image1.image = photo1
label_image1.place(x = 590, y= 675)

image_button = Image.open("button_blue.png")
image_button = image_button.resize((50,50))
photo_button = ImageTk.PhotoImage(image_button)
#photo_button = photo_button.subsample(3, 3) 
#########################################################################

tkTop.counter = 0
b = tkTop.counter

varLabel = tkinter.IntVar()
tkLabel = tkinter.Label(textvariable=varLabel, )
tkLabel.pack()

varLabel2 = tkinter.IntVar()
tkLabel2 = tkinter.Label(textvariable=varLabel2, )
tkLabel2.pack()

# Label for the buttons section
label_buttons = tkinter.Label(tkTop, text='Delta Robot Motion Scenario Selector', font=("Poppins Medium", 15), fg='black')
label_buttons.place(x = 80, y = 200)

button1 = tkinter.IntVar()
button1state = tkinter.Button(tkTop,
    image = photo_button,
    compound = 'left',
    #text="  Cornering Demo",
    #font=("Poppins", 10),
    command=set_button2_state,
    height=50,
    fg="black",
    width=50,
    bd=5,
    activebackground='green'
)
button1state.pack(anchor='w', ipadx=10, padx=10, pady=5)
button1state.place(x = 80, y = 250)
label_buttons = tkinter.Label(tkTop, text='Cornering Demo', font=("Poppins", 12), fg='black')
label_buttons.place(x = 150, y = 260)



button2 = tkinter.IntVar()
button2state = tkinter.Button(tkTop,
    image = photo_button,
    compound = 'left',
    #text="  Pick and Place Demo",
    #font=("Poppins", 10),
    command=set_button2_state,
    height=50,
    fg="black",
    width=50,
    bd=5,
    #activebackground='green'
)
button2state.pack(anchor='w', ipadx=10, padx=10, pady=5)
button2state.place(x = 80, y = 350-20)
label_buttons = tkinter.Label(tkTop, text='Pick and Place Demo', font=("Poppins", 12), fg='black')
label_buttons.place(x = 150, y = 360-20)


tkinter.mainloop()
