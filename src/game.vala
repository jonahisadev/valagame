namespace Game {

	public class CoreGame {

		private Window win;
		private Gtk.TextView text;

		public CoreGame(string[] args) {
			Gtk.init(ref args);
		}

		public void start() {
			setup_window();
			log("Vala Game by @jonahisadev");
			win.start();
			Gtk.main();
		}

		public void quit() {
			// Run any quit things
			Gtk.main_quit();
		}

		public void run_cmd(string cmd) {
			if (cmd != "") {
				if (cmd == "exit") {
					quit();
				} else if (cmd == "hi") {
					log("Hello there!");
				}
			}
		}

		public void log(string str) {
			this.text.buffer.text += str + "\n";
		}

		public void setup_window() {
			this.win = new Window("Vala Game", 600, 450, this);
			var layout = new Gtk.Fixed();
			layout.border_width = 5;
			win.add(layout);

			// Scrolling
			var scroll = new Gtk.ScrolledWindow(null, null);
			scroll.set_size_request(600, 400);
			layout.put(scroll, 0, 0);

			// Text View
			text = new Gtk.TextView();
			text.set_wrap_mode(Gtk.WrapMode.WORD);
			text.editable = false;
			text.left_margin = 5;
			text.top_margin = 5;
			text.cursor_visible = false;
			scroll.add(text);

			// Command Bar
			var input = new Gtk.Entry();
			input.width_request = 500;
			input.placeholder_text = "Command";
			input.activate.connect(() => {
				unowned string str = input.get_text();
				run_cmd(str);
				input.set_text("");
			});
			layout.put(input, 0, 405);
			
			// Enter Button
			var button = new Gtk.Button.with_label("Enter");
			button.width_request = 95;
			button.clicked.connect(() => {
				unowned string str = input.get_text();
				run_cmd(str);
				input.set_text("");
			});
			layout.put(button, 505, 405);
		}

	}
}