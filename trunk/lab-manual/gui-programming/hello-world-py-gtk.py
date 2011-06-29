import pygtk
pygtk.require('2.0')
import gtk

class HelloWorld:
	def __init__(self):
		self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
		self.window.set_border_width(5)
		self.button = gtk.Button("Hello World!")
		self.window.add(self.button)
		self.window.show_all()
		
	def main(self):
		gtk.main()
		
if __name__ == "__main__":
	hello = HelloWorld()
	hello.main()
