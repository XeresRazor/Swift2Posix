//
//  File.swift
//  Swift2Posix
//
//  Created by David Green on 7/28/15.
//  Copyright © 2015 David Green. All rights reserved.
//

import Darwin

public class File {
    public enum FileMode: String {
        case Read = "r"
        case Write = "w"
        case Append = "a"
        case ReadExtended = "r+"
        case WriteExtended = "w+"
        case AppendExtended = "a+"
        case WriteAccess = "wx"
        case WriteExtendedAccess = "w+x"
    }
    
    public enum FileError: ErrorType {
        case FileNotOpenedError
        case FileOpenError
        case EndOfFileError
        case FileIOError(errorCode: Int)
        case SeekFailedError
    }
    
    public enum SeekStyle {
        case Set
        case Current
        case End
    }
    
    private var fileHandle: UnsafeMutablePointer<FILE> = nil
    
    // TODO: Document all of this.
    
    public func open(filename: String, mode: FileMode) throws {
        self.fileHandle = fopen(filename, mode.rawValue)
        
        if self.fileHandle == nil {
            throw FileError.FileOpenError
        }
    }
    
    public func close() {
        if self.fileHandle != nil {
            fclose(self.fileHandle)
            self.fileHandle = nil
        }
    }
    
    // MARK: - Seeking
    
    public func tell() throws -> Int {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let position = ftell(self.fileHandle)
        
        if position == Int(EOF) {
            throw FileError.EndOfFileError
        }
        
        return position
    }
    
    public func seek(offset: Int, origin: SeekStyle) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        var seekStyle: Int32
        
        switch origin {
        case .Set:
            seekStyle = SEEK_SET
        case .Current:
            seekStyle = SEEK_CUR
        case .End:
            seekStyle = SEEK_END
        }
        
        let result = fseek(self.fileHandle, offset, seekStyle)
        
        if result != 0 {
            throw FileError.SeekFailedError
        }
    }
    
    // MARK: - Read functionality
    
    public func readUInt8() throws -> UInt8 {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        var buffer = UInt8(0)
        let size = sizeof(buffer.dynamicType)
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readUInt8Array(count: Int) throws -> [UInt8] {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        var buffer = [UInt8](count: count, repeatedValue: 0)
        let size = sizeof(buffer[0].dynamicType)
        
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readInt8() throws -> Int8 {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        var buffer = Int8(0)
        let size = sizeof(buffer.dynamicType)
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readInt8Array(count: Int) throws -> [Int8] {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        var buffer = [Int8](count: count, repeatedValue: 0)
        let size = sizeof(buffer[0].dynamicType)
        
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readUInt16() throws -> UInt16 {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        var buffer = UInt16(0)
        let size = sizeof(buffer.dynamicType)
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readUInt16Array(count: Int) throws -> [UInt16] {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        var buffer = [UInt16](count: count, repeatedValue: 0)
        let size = sizeof(buffer[0].dynamicType)
        
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readInt16() throws -> Int16 {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        var buffer = Int16(0)
        let size = sizeof(buffer.dynamicType)
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readInt16Array(count: Int) throws -> [Int16] {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        var buffer = [Int16](count: count, repeatedValue: 0)
        let size = sizeof(buffer[0].dynamicType)
        
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readUInt32() throws -> UInt32 {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        var buffer = UInt32(0)
        let size = sizeof(buffer.dynamicType)
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readUInt32Array(count: Int) throws -> [UInt32] {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        var buffer = [UInt32](count: count, repeatedValue: 0)
        let size = sizeof(buffer[0].dynamicType)
        
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readInt32() throws -> Int32 {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        var buffer = Int32(0)
        let size = sizeof(buffer.dynamicType)
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readInt32Array(count: Int) throws -> [Int32] {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        var buffer = [Int32](count: count, repeatedValue: 0)
        let size = sizeof(buffer[0].dynamicType)
        
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readUInt64() throws -> UInt64 {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        var buffer = UInt64(0)
        let size = sizeof(buffer.dynamicType)
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readUInt64Array(count: Int) throws -> [UInt64] {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        var buffer = [UInt64](count: count, repeatedValue: 0)
        let size = sizeof(buffer[0].dynamicType)
        
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readInt64() throws -> Int64 {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        var buffer = Int64(0)
        let size = sizeof(buffer.dynamicType)
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readInt64Array(count: Int) throws -> [Int64] {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        var buffer = [Int64](count: count, repeatedValue: 0)
        let size = sizeof(buffer[0].dynamicType)
        
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readFloat32() throws -> Float32 {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        var buffer = Float32(0)
        let size = sizeof(buffer.dynamicType)
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readFloat32Array(count: Int) throws -> [Float32] {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        var buffer = [Float32](count: count, repeatedValue: 0)
        let size = sizeof(buffer[0].dynamicType)
        
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readFloat64() throws -> Float64 {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        var buffer = Float64(0)
        let size = sizeof(buffer.dynamicType)
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    public func readFloat64Array(count: Int) throws -> [Float64] {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        var buffer = [Float64](count: count, repeatedValue: 0)
        let size = sizeof(buffer[0].dynamicType)
        
        let readCount = fread(&buffer, size, count, self.fileHandle)
        
        if readCount != count {
            if feof(self.fileHandle) != 0 {
                throw FileError.EndOfFileError
            }
            
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
        
        return buffer
    }
    
    // MARK: - Read functionality
    
    public func writeUInt8(var value: UInt8) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        let size = sizeof(value.dynamicType)
        let writeCount = fwrite(&value, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeUInt8Array(var values: [UInt8]) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = values.count
        let size = sizeof(values[0].dynamicType)
        let writeCount = fwrite(&values, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeInt8(var value: Int8) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        let size = sizeof(value.dynamicType)
        let writeCount = fwrite(&value, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeInt8Array(var values: [Int8]) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = values.count
        let size = sizeof(values[0].dynamicType)
        let writeCount = fwrite(&values, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeUInt16(var value: UInt16) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        let size = sizeof(value.dynamicType)
        let writeCount = fwrite(&value, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeUInt16Array(var values: [UInt16]) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = values.count
        let size = sizeof(values[0].dynamicType)
        let writeCount = fwrite(&values, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeInt16(var value: Int16) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        let size = sizeof(value.dynamicType)
        let writeCount = fwrite(&value, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeInt16Array(var values: [Int16]) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = values.count
        let size = sizeof(values[0].dynamicType)
        let writeCount = fwrite(&values, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeUInt32(var value: UInt32) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        let size = sizeof(value.dynamicType)
        let writeCount = fwrite(&value, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeUInt32Array(var values: [UInt32]) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = values.count
        let size = sizeof(values[0].dynamicType)
        let writeCount = fwrite(&values, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeInt32(var value: Int32) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        let size = sizeof(value.dynamicType)
        let writeCount = fwrite(&value, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeInt32Array(var values: [Int32]) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = values.count
        let size = sizeof(values[0].dynamicType)
        let writeCount = fwrite(&values, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeUInt64(var value: UInt64) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        let size = sizeof(value.dynamicType)
        let writeCount = fwrite(&value, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeUInt64Array(var values: [UInt64]) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = values.count
        let size = sizeof(values[0].dynamicType)
        let writeCount = fwrite(&values, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeInt64(var value: Int64) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        let size = sizeof(value.dynamicType)
        let writeCount = fwrite(&value, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeInt64Array(var values: [Int64]) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = values.count
        let size = sizeof(values[0].dynamicType)
        let writeCount = fwrite(&values, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeFloat32(var value: Float32) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        let size = sizeof(value.dynamicType)
        let writeCount = fwrite(&value, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeFloat32Array(var values: [Float32]) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = values.count
        let size = sizeof(values[0].dynamicType)
        let writeCount = fwrite(&values, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeFloat64(var value: Float64) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = 1
        let size = sizeof(value.dynamicType)
        let writeCount = fwrite(&value, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
    
    public func writeFloat64Array(var values: [Float64]) throws {
        guard self.fileHandle != nil else {
            throw FileError.FileNotOpenedError
        }
        
        let count = values.count
        let size = sizeof(values[0].dynamicType)
        let writeCount = fwrite(&values, size, count, self.fileHandle)
        
        if writeCount != count {
            let error = ferror(self.fileHandle)
            throw FileError.FileIOError(errorCode: Int(error))
        }
    }
}
