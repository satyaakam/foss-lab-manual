#author : balakrishnan balakpm101@gmail.com


import pygtk
pygtk.require('2.0')
import gtk
class HelloWorldWa:
	def destroy(self, widget, data=None):
	    print "Completely quit"
	    gtk.main_quit()
	def __init__(self):
		self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
		self.window.connect("destroy", self.destroy)
		self.window.set_border_width(40)
		self.label = gtk.Label("Hello World!!!")
		self.label.show()
		self.window.add(self.label)
		self.window.show()
	def main(self):
		gtk.main()
if __name__ == "__main__":
	hellowa = HelloWorldWa()
	hellowa.main()
