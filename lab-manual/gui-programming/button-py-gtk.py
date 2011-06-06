#author : balakrishnan balakpm101@gmail.com


#!/usr/bin/env python
# example helloworld.py
import pygtk
pygtk.require('2.0')
import gtk

class HelloWorld:
	def hello(self, widget, data=None):
		print "Hello World"
	def delete_event(self, widget, event, data=None):
		print "delete event occurred"
		return False
	def destroy(self, widget, data=None):
	    print "Completely quit"
	    gtk.main_quit()
	def __init__(self):
		self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
		self.window.connect("delete_event", self.delete_event)
		self.window.connect("destroy", self.destroy)
		self.window.set_border_width(50)
		self.hobox = gtk.HBox(False, 0)
		self.window.add(self.hobox)
		self.b = gtk.Button("Hello World")
		self.b.connect("clicked", self.hello)
		self.hobox.pack_start(self.b, True, False, 0)
		self.b.show()
		
		self.a=gtk.Button("    Exit   ")
		self.a.connect("clicked", self.destroy)
		self.hobox.pack_start(self.a, True, False, 0)
		self.a.show()
		
		self.hobox.show()
		self.window.show()
	def main(self):
		gtk.main()
if __name__ == "__main__":
	hello = HelloWorld()
	hello.main()

