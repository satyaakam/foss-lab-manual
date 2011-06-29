import pygtk
pygtk.require('2.0')
import gtk
import pango

class SysInfo:
    def on_button_clicked(self, button, filename):
        text = open("/proc/" + filename).read()
        self.info_view.get_buffer().set_text(text)

    def on_window_destroy(self, window):
        gtk.main_quit();
    
    def __init__(self):
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.connect("destroy", self.on_window_destroy)
        self.window.set_border_width(5)

        self.main_hbox = gtk.HBox()
        self.window.add(self.main_hbox)
        
        self.button_vbox = gtk.VBox()
        self.main_hbox.pack_start(self.button_vbox, expand=False)

        filename_list = ["cpuinfo", "meminfo", "interrupts"]
        for filename in filename_list:
            button = gtk.Button(filename)
            self.button_vbox.pack_start(button, expand=False)
            button.connect("clicked", self.on_button_clicked, filename)

        self.scroll_win = gtk.ScrolledWindow()
        self.main_hbox.pack_start(self.scroll_win, expand=True, fill=True)
        self.info_view = gtk.TextView()
        self.scroll_win.add(self.info_view)
        
        self.info_view.set_editable(False)
        self.info_view.modify_font(pango.FontDescription("courier"))

        self.window.show_all()
        
    def main(self):
        gtk.main()

if __name__ == "__main__":
    sysinfo = SysInfo()
    sysinfo.main()
