import Foundation

// MARK: - Write data to file
func writeToURL(text: String, fileName: String) {
    let fileURL = try! FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("/Diskr_Indiv/" + fileName)

    if let outputStream = OutputStream(url: fileURL, append: true) {
        outputStream.open()
        let bytesWritten = outputStream.write(text, maxLength: text.count)
        if bytesWritten < 0 {
            print("write failure")
        }
        outputStream.close()
    } else {
        print("Unable to open file")
    }
}
