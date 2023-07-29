const headers = $request.headers;
const originalUA = headers['User-Agent'];

if (originalUA.includes('iPhone')) {
  // 如果原始 User-Agent 包含 'iPhone'，则认为是 iPhone 设备
  headers['User-Agent'] = 'Mozilla/5.0 (${ua}; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.41';
} else if (originalUA.includes('Macintosh')) {
  // 如果原始 User-Agent 包含 'Macintosh'，则认为是 macOS 设备
  headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.51';
}

// 添加其他请求头部信息
headers['sec-ch-ua'] = '"Chromium";v="110", "Not A(Brand";v="24", "Microsoft Edge";v="110"';
headers['sec-ch-ua-mobile'] = '?0';
headers['sec-ch-ua-platform'] = 'macOS';

$done({ headers });
