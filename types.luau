--// incase you want to use them.
type Theme = "Background" | "Glow" | "Accent" | "LightContrast" | "DarkContrast" | "TextColor"
type BindKey = Enum.KeyCode | Enum.UserInputType
 
type WindowOptions = {title: string?}
type PageOptions = {title: string?, icon: number?}
type SectionOptions = {title: string?}
type SelectPageOptions = {page: Page, toggle: boolean?}
type ThemeOptions = {theme: Theme, color3: Color3}
type NotifyOptions = {title: string?, text: string?, callback: ((accepted: boolean) -> ())?}
 
type ButtonOptions = {
	title: string?,
	callback: (() -> ())?
}
 
type ToggleOptions = {
	title: string?,
	default: boolean?,
	callback: ((toggled: boolean) -> ())?
}
 
type ToggleUpdate = {
	title: string?,
	toggled: boolean?,
	callback: ((toggled: boolean) -> ())?
}
 
type TextboxOptions = {
	title: string?,
	default: string?,
	callback: ((text: string, focusLost: boolean?) -> ())?
}
 
type KeybindOptions = {
	title: string?,
	key: BindKey?,
	gameProcessedEvent: boolean?,
	callback: (() -> ())?,
	changedCallback: ((key: BindKey) -> ())?
}
 
type ColorPickerOptions = {
	title: string?,
	default: Color3?,
	callback: ((color3: Color3) -> ())?
}
 
type ColorPickerUpdate = {
	title: string?,
	default: (Color3 | {number})?,
	callback: ((color3: Color3) -> ())?
}
 
type SliderOptions = {
	title: string?,
	min: number?,
	max: number?,
	default: number?,
	precision: number?,
	callback: ((value: number) -> ())?
}
 
type SliderUpdate = {
	title: string?,
	min: number?,
	max: number?,
	default: number?,
	precision: number?,
	value: number?,
	callback: ((value: number) -> ())?
}
 
type DropdownOptions = {
	title: string?,
	list: {any}?,
	default: any?,
	callback: ((value: string) -> ())?
}
 
type DropdownUpdate = {
	title: string?,
	list: {any}?,
	callback: ((value: string) -> ())?
}
 
type Module<T> = {
	Instance: Instance,
	Options: T
}
 
type ButtonSettings = {
	title: string,
	callback: () -> (),
	Update: (self: ButtonSettings, data: ButtonOptions) -> ()
}
 
type ToggleSettings = {
	title: string,
	toggled: boolean,
	callback: (toggled: boolean) -> (),
	Update: (self: ToggleSettings, data: ToggleUpdate) -> ()
}
 
type TextboxSettings = {
	title: string,
	default: string,
	callback: (text: string, focusLost: boolean?) -> (),
	Update: (self: TextboxSettings, data: TextboxOptions) -> ()
}
 
type KeybindSettings = {
	title: string,
	key: BindKey,
	gameProcessedEvent: boolean,
	callback: () -> (),
	changedCallback: (key: BindKey) -> (),
	Update: (self: KeybindSettings, data: KeybindOptions) -> ()
}
 
type ColorPickerSettings = {
	title: string?,
	default: Color3,
	color3: Color3?,
	callback: (color3: Color3) -> (),
	Update: (self: ColorPickerSettings, data: ColorPickerUpdate) -> ()
}
 
type SliderSettings = {
	title: string?,
	min: number,
	max: number,
	default: number,
	precision: number,
	value: number,
	callback: (value: number) -> (),
	Update: (self: SliderSettings, data: SliderUpdate) -> ()
}
 
type DropdownSettings = {
	title: string?,
	list: {string},
	default: any?,
	callback: (value: string) -> (),
	Update: (self: DropdownSettings, data: DropdownUpdate) -> ()
}
 
type ButtonModule = Module<ButtonSettings>
type ToggleModule = Module<ToggleSettings>
type TextboxModule = Module<TextboxSettings>
type KeybindModule = Module<KeybindSettings>
type ColorPickerModule = Module<ColorPickerSettings>
type SliderModule = Module<SliderSettings>
type DropdownModule = Module<DropdownSettings>
 
type Section = {
	page: Page,
	container: Frame,
	modules: {Module<any>},
	addButton: (self: Section, data: ButtonOptions?) -> ButtonModule,
	addToggle: (self: Section, data: ToggleOptions?) -> ToggleModule,
	addTextbox: (self: Section, data: TextboxOptions?) -> TextboxModule,
	addKeybind: (self: Section, data: KeybindOptions?) -> KeybindModule,
	addColorPicker: (self: Section, data: ColorPickerOptions?) -> ColorPickerModule,
	addSlider: (self: Section, data: SliderOptions?) -> SliderModule,
	addDropdown: (self: Section, data: DropdownOptions?) -> DropdownModule,
	getModule: (self: Section, info: string | Instance) -> Module<any>,
	Resize: (self: Section, smooth: boolean?) -> ()
}
 
type Page = {
	library: Library,
	container: ScrollingFrame,
	button: TextButton,
	sections: {Section},
	lastPosition: number?,
	addSection: (self: Page, data: SectionOptions?) -> Section,
	setOrderPos: (self: Page, newPos: number) -> (),
	Resize: (self: Page, scroll: boolean?) -> ()
}
 
type Library = {
	container: ScreenGui,
	pagesContainer: ScrollingFrame,
	pages: {Page},
	focusedPage: Page?,
	toggling: boolean?,
	position: UDim2?,
	activeNotification: (() -> ())?,
	activePicker: any?,
	reorderPageButtons: (self: Library) -> (),
	setTitle: (self: Library, title: string) -> (),
	addPage: (self: Library, data: PageOptions?) -> Page,
	SelectPage: (self: Library, data: SelectPageOptions) -> (),
	setTheme: (self: Library, data: ThemeOptions) -> (),
	toggle: (self: Library) -> (),
	Notify: (self: Library, data: NotifyOptions?) -> ()
}
