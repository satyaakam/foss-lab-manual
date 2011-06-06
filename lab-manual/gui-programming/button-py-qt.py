#!/usr/bin/env python
 
import sys
from PyQt4 import Qt
 
a = Qt.QApplication(sys.argv)
 
# Our function to call when the button is clicked
def sayHello():
    print "Hello, World!"
 
# Instantiate the button
hellobutton = Qt.QPushButton("Say 'Hello world!'",None)
 
# And connect the action "sayHello" to the event "button has been clicked"
a.connect(hellobutton, Qt.SIGNAL("clicked()"), sayHello)
 
# The rest is known already...
#a.setMainWidget(hellobutton)
hellobutton.show()
a.exec_()

