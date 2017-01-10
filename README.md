# AsyncTask

Example usage:
```objective-c
[AsyncTask launchPath:@"/sbin/ping" currentDirectoryPath:nil arguments:@[@"github.com"] outputBlock:^(NSString *outString) {
    NSLog(@"OUT:%@",outString);
} errBlock:^(NSString *errString) {
    NSLog(@"ERR:%@",errString);
} onLaunch:^{
    NSLog(@"Launch");
} onExit:^{
    NSLog(@"Exit");
}];
```

Screenshot
![AsyncTask](https://github.com/XieXieZhongxi/AsyncTask/blob/master/screenshot.png)

## License

View the LICENSE file for more info.
