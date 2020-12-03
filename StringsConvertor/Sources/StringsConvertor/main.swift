import Foundation

let currentFileURL = URL(fileURLWithPath: "\(#file)", isDirectory: false)
let packageRootURL = currentFileURL.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
let repoRootURL = packageRootURL.deletingLastPathComponent()

var jsonFileURLs: [URL] = []
do {
    let urls = try FileManager.default.contentsOfDirectory(at: repoRootURL, includingPropertiesForKeys: [.nameKey, .isDirectoryKey], options: [])
    for url in urls where url.pathExtension == "json" {
        jsonFileURLs.append(url)
    }
} catch {
    print("error: \(#file) \(#line) \(error.localizedDescription)")
    exit(1)
}

for url in jsonFileURLs {
    print("parse \(url.debugDescription)")
    do {
        let data = try Data(contentsOf: url)
        let parser = try Parser(data: data)
        let strings = parser.generateStrings()
        print(strings)
    } catch {
        print("error: \(#file) \(#line) \(error.localizedDescription)")
        continue
    }
}
