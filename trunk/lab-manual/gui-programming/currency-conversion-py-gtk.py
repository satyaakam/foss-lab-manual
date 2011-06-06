#author : balakrishnan balakpm101@gmail.com

import pygtk
pygtk.require('2.0')
import gtk
class Conversion:
    def convert(self,widget):
        self.t1=self.text1.get_text()
        self.val=int(self.t1)
        self.vali=self.val*44.75
        self.text2.set_text(str(self.vali))
        self.vale=self.val*0.68
        self.text3.set_text(str(self.vale))
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
        self.window.set_border_width(60)
        table=gtk.Table(4, 2, True)
        self.window.add(table)
        self.label1=gtk.Label("Enter USD Amount: ")
        table.attach(self.label1, 0, 1, 0, 1)
        self.label1.show()
        self.text1=gtk.Entry(0)
        table.attach(self.text1, 1,2,0,1)
        self.text1.show()
        self.label2=gtk.Label("Indian Value Is (INR): ")
        table.attach(self.label2, 0,1,1,2)
        self.label2.show()
        self.text2=gtk.Entry(0)
        table.attach(self.text2, 1,2,1,2)
        self.text2.show()
        self.label3=gtk.Label("Euro Value Is (EUR): ")
        table.attach(self.label3, 0,1,2,3)
        self.label3.show()
        self.text3=gtk.Entry(0)
        table.attach(self.text3, 1,2,2,3)
        self.text3.show()
        self.but1=gtk.Button("Convert")
        self.but1.connect("clicked",self.convert)
        table.attach(self.but1,0,1,3,4)
        self.but1.show()
        self.but2=gtk.Button("Quit")
        self.but2.connect("clicked",self.destroy)
        table.attach(self.but2,1,2,3,4)
        self.but2.show()
        table.show()
        self.window.show()
    def main(self):
        gtk.main()
        
if __name__ == "__main__":
    conversion = Conversion()
    conversion.main()
        			    		
