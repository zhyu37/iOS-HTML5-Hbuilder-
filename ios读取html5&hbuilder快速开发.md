===
##iOS读取HTML5&Hbuilder快速开发
>HTML5是一种新型的语言，但是却越发的有用。
<p>iOS读取本地HTML5
<pre>
//通过UIWebView 来读取本地HTML
		let webView = UIWebView()
        webView.frame = UIScreen.mainScreen().bounds
        view.addSubview(webView)
        do{
            let filePath = NSBundle.mainBundle().pathForResource("index", ofType: "html")
            let html = try String(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding)
            webView.loadHTMLString(html, baseURL: nil)
        }catch{
            
   }
   //求大神 指点HTML与iOS交互 
   //是采用WebViewJavascriptBridge?
</pre>
<p>加载本地HTML文件
<pre>
1.第一种方式,使用loadRequest:方法加载本地文件NSURLRequest
NSString* path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
NSURL* url = [NSURL fileURLWithPath:path];
NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
[webView loadRequest:request];
2.第二种方式,使用loadHTMLString:baseURL:加载HTML字符串
NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
[webView loadHTMLString:html baseURL:baseURL];
参考大神博客:http://blog.csdn.net/kaitiren/article/details/17115085
</pre>

<p>Hbuilder
<pre>
Hbuilder是由国内开发者开发HTML5开发平台，可以快速集成安卓端、iOS端、网页。采用mui框架，mui框架基于htm5plus的XMLHttpRequest，封装了常用的Ajax函数

</pre>
<p>mui框架AJAX
<pre>
//文档:http://dev.dcloud.net.cn/mui/
mui.ajax('http://server-name/login.php',{
	data:{
		username:'username',
		password:'password'
	},
	dataType:'json',//服务器返回json格式数据
	type:'post',//HTTP请求类型
	timeout:10000,//超时时间设置为10秒；
	success:function(data){
		//服务器返回响应，根据响应结果，分析是否登录成功；
		...
	},
	error:function(xhr,type,errorThrown){
		//异常处理；
		console.log(type);
	}
});
</pre>
