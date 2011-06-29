#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import gtk

class HelloWorld:
	def on_combo_changed(self, widget, data=None):
		print self.combo.get_active_text()
		
	def on_window_destroy(self, widget, data=None):
		gtk.main_quit()
		
	def __init__(self):
		self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
		self.window.connect("destroy", self.on_window_destroy)
		self.window.set_border_width(5)

		self.combo = gtk.combo_box_new_text()
		self.combo.append_text("GNU/Linux")
		self.combo.append_text("Windows")
		self.combo.append_text("Mac OS X")
		self.combo.connect("changed", self.on_combo_changed)
		self.window.add(self.combo)

		self.window.show_all()
		
	def main(self):
		gtk.main()
		
if __name__ == "__main__":
	hello = HelloWorld()
	hello.main()
