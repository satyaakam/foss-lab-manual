import pygtk
pygtk.require('2.0')
import gtk

class Conversion:
    def on_convert_clicked(self,widget):
        usd = self.usd_entry.get_text()
        usd = int(usd)
        inr = usd * 44.75
        self.inr_entry.set_text(str(inr))
        
    def on_window_destroy(self, widget, data=None):
        gtk.main_quit()
        
    def __init__(self):
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.connect("destroy", self.on_window_destroy)
        self.window.set_border_width(5)
        
        table = gtk.Table(4, 2, homogeneous=False)
        self.window.add(table)

        ef = gtk.EXPAND | gtk.FILL
        
        self.usd_label = gtk.Label("Enter USD Amount: ")
        table.attach(self.usd_label, 0, 1, 0, 1, 0, 0, 5, 5)
        self.usd_entry = gtk.Entry(0)
        table.attach(self.usd_entry, 1, 2, 0, 1, ef, 0, 5, 5)

        self.inr_label = gtk.Label("Indian Value Is (INR): ")
        table.attach(self.inr_label, 0, 1, 1, 2, 0, 0, 5, 5)
        self.inr_entry = gtk.Entry(0)
        table.attach(self.inr_entry, 1, 2, 1, 2, ef, 0, 5, 5)

        self.convert_button = gtk.Button("Convert")
        self.convert_button.connect("clicked", self.on_convert_clicked)
        table.attach(self.convert_button, 0, 2, 3, 4, ef, 0, 5, 5)

        self.window.show_all()
        
    def main(self):
        gtk.main()
        
if __name__ == "__main__":
    conversion = Conversion()
    conversion.main()
        			    		
