# NotarizationInfo

Decode notarization information from upload, info and history request using `xcrun altool` with `--output-format xml` as argument.

## Decode 

```swift
 let response = try NotarizationResponse(from: data) // or string
 ```

## Get request UUID after uploading

`xcrun altool --notarize-app ...`

```swift
 if let uuid = response.notarizationUpload?.requestUUID {
 ... 
 }
```

## Get status

`xcrun altool --notarization-info <id> ...`

```swift
 if let status = response.notarizationInfo?.status {
 
 }
```

## Get history

 `xcrun altool --notarization-history ...`

```swift
 for item in response.notarizationHistory?.items ?? [] {
 ... 
 }
```
