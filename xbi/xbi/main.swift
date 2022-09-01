import Cocoa
import Foundation

let args = CommandLine.arguments
if args.count == 2 {
	if args[1].lowercased() == "-v" || args[1].lowercased() == "--version" {
		version()
	} else if args[1].lowercased() == "-h" || args[1].lowercased() == "--help" {
		usage()
	} else {
		error("Unknown option: '\(args[1])'\n")
		usage()
	}
} else if args.count == 4 {
	let bundle = CommandLine.arguments[1]
	let size = Float(CommandLine.arguments[2]) ?? -1
	let file = CommandLine.arguments[3]
	
    if let path = NSWorkspace.shared.urlForApplication(withBundleIdentifier: bundle) {
		let image = NSWorkspace.shared.icon(forFile: path.path)
		for representation in image.representations where representation.description.contains("scale: 1.0") {
			if representation.size.width == CGFloat(size) && representation.size.height == CGFloat(size) {
				let image = NSImage(size: representation.size)
				image.addRepresentation(representation)
                do {
                    try image.tiffRepresentation?.write(to: URL(fileURLWithPath: file))
                    break
                } catch {
                    debugPrint("Something went wrong: \(error.localizedDescription)\n")
                    usage()
                }
			}
		}
	} else {
		error("Invalid path for bundle: \(bundle)")
        usage()
	}
} else {
	usage()
}

/* COMMANDS */
func usage() {
	let str =
    """
    USAGE: xbi [--version] <bundle> <size> <file>

    OPTIONS:
        -v, --version   Print the version and exit
        -h, --help      Show help information.

    SUBCOMMANDS:
        bundle          The app bundle id
        size            The icon size to export
        file            The file destination to save
    """
	print(str)
}

func version() {
	let str =
    """
    VERSION: 1.0 (221001)
    """
	print(str)
}

func error(_ string: String) {
	let str =
    """
    ERROR: \(string)
    """
	print(str)
}
