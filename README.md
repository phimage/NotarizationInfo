# NotarizationInfo

Decode notarization information from upload and info request using `xcrun altool` with `--output-format xml` as argument.

## Decode 

```swift
 let response = try NotarizationResponse(from: data) // or string
 ```

## Get request UUID after upoading

```swift
 if let uuid = response.notarizationUpload?.requestUUID {
 ... 
 }
```

## Get status

```swift
 if let status = response.notarizationInfo?.status {
 
 }
```
