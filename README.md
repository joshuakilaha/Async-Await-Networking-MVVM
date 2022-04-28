# Async-Await-Networking-MVVM (AsyncImage)
Using Async requests with AsyncImage on an application to be launched asynchronously.

AsyncImage
A view that asynchronously loads and displays an image.

```
AsyncImage(url: URL(string: "https://example.com/icon.png")) { image in
    image.resizable()
} placeholder: {
    ProgressView()
}
.frame(width: 50, height: 50)

```

<p float="center">
<img src ="https://user-images.githubusercontent.com/33428918/165736248-f9b0195a-2188-4691-b186-a0ca51fb4a5a.PNG" width="250" height="450" />
<img src ="https://user-images.githubusercontent.com/33428918/165736255-590197c1-5638-4127-9b0c-880a4ba094d3.PNG" width="250" height="450" />
 </p>
