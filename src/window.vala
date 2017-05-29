namespace Game {

	class Window : Gtk.Window {
		
		private CoreGame game;

		public Window(string title, int width, int height, CoreGame game) {
			this.game = game;

			this.title = title;
			this.set_default_size(width, height);
			this.window_position = Gtk.WindowPosition.CENTER;
			this.destroy.connect(() => {
				this.game.quit();
			});
			this.resizable = false;
		}

		public void start() {
			this.show_all();
		}

	}

}