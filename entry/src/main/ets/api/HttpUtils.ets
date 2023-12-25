import http from '@ohos.net.http'
import systemDateTime from '@ohos.systemDateTime'
import { ResponseResult } from './ResponseResult'

enum RequestMethod {
  OPTIONS,
  GET,
  HEAD,
  POST,
  PUT,
  DELETE,
  TRACE,
  CONNECT
}

export class HttpUtils {
  public static readonly SUCCESS_CODE: number = 0
  public static readonly READ_TIME_OUT = 60 * 1000
  public static readonly CONNECT_TIME_OUT = 60 * 1000
  private baseUrl: string = ""

  constructor(baseUrl: string) {
    this.baseUrl = baseUrl
  }

  private methodName(method: RequestMethod): http.RequestMethod {
    switch (method) {
      case RequestMethod.OPTIONS: {
        return http.RequestMethod.OPTIONS
      }
      case RequestMethod.GET: {
        return http.RequestMethod.GET
      }
      case RequestMethod.HEAD: {
        return http.RequestMethod.HEAD
      }
      case RequestMethod.POST: {
        return http.RequestMethod.POST
      }
      case RequestMethod.PUT: {
        return http.RequestMethod.PUT
      }
      case RequestMethod.DELETE: {
        return http.RequestMethod.DELETE
      }
      case RequestMethod.TRACE: {
        return http.RequestMethod.TRACE
      }
      case RequestMethod.CONNECT: {
        return http.RequestMethod.CONNECT
      }

    }

  }

  private tag(n: string): string {
    return `/${n}`
  }

  request<T>(path: string, reqMethod: RequestMethod, parameter: Map<string, Object> = null): Promise<T | null> {
    // 注意的是每一个httpRequest对象对应一个http请求任务，不可复用。
    const httpRequest = http.createHttp()
    const method = this.methodName(reqMethod)
    let extraData = {}
    // let url = `${this.baseUrl}/${path}`
    let url = `${path}`
    if (parameter != null) {
      switch (reqMethod) {
        case RequestMethod.POST, RequestMethod.PUT: {
          extraData = Object.fromEntries(parameter)
          break;
        }
        case RequestMethod.GET, RequestMethod.DELETE: {
          const urlParams = Object.keys(parameter).map(key => `${key}=${parameter[key]}`).join('&')
          if (url.includes("?")) {
            url = `${url}${urlParams}`
          } else {
            url = `${url}?${urlParams}`
          }
          break;
        }
      }
    }
    let n = Math.random().toString(10).slice(2)
    console.debug(this.tag(n), "==================Request====================")
    console.debug(this.tag(n), "url: " + url)
    console.debug(this.tag(n), "method: " + method.toString())
    if (reqMethod == RequestMethod.POST || reqMethod == RequestMethod.PUT)
      console.debug(this.tag(n), "extraData: " + JSON.stringify(parameter, null, 2))

    return new Promise(async (resolve, reject) => {
      // let beginTime = await systemDateTime.getCurrentTime(false)
      httpRequest.request(url,
        {
          method,
          readTimeout: HttpUtils.READ_TIME_OUT,
          connectTimeout: HttpUtils.CONNECT_TIME_OUT,
          header: {
            'Content-Type': 'application/json'
          },
          extraData
        }
      ).then(async (value) => {
        // let endTime = await systemDateTime.getCurrentTime(false)
        console.log(this.tag(n), "==================Response====================")
        // console.debug(this.tag(n), "url: " + url + " "+ (endTime - beginTime)+"ms")
        console.log(this.tag(n), "method: " + method.toString())
        console.log(this.tag(n), "header: " + JSON.stringify(value.header, null, 2))
        console.log(this.tag(n), "responseCode: " + value.responseCode)
        console.log(this.tag(n), "resultType: " + value.resultType)
        console.log(this.tag(n), "resultType: " + value.result.toString())
        if (value.responseCode == http.ResponseCode.OK) {
          let result = JSON.parse(value.result.toString())
          console.debug(this.tag(n), "body: " + JSON.stringify(result, null, 2))
          // if (result.errorCode == HttpUtils.SUCCESS_CODE) {
          //   resolve(result)
          // } else {
          //   reject(result)
          // }
          resolve(result)
        } else {
          reject("请求失败")
        }
      }).catch((reason) => {
        console.log(reason)
        reject(reason)

      })
    })
  }

  get<T>(path: string, parameter: Map<string, Object> = null): Promise<T | null> {
    return this.request<T>(path, RequestMethod.GET, parameter)
  }

  post<T>(path: string, parameter: Map<string, Object> = null): Promise<T | null> {
    return this.request<T>(path, RequestMethod.POST, parameter)
  }

  delete<T>(path: string, parameter: Map<string, Object> = null): Promise<T | null> {
    return this.request<T>(path, RequestMethod.DELETE, parameter)
  }

  put<T>(path: string, parameter: Map<string, Object> = null): Promise<T | null> {
    return this.request<T>(path, RequestMethod.PUT, parameter)
  }
}

// const HTNet = new HttpUtils('https://baobab.kaiyanapp.com/')
const HTNet = new HttpUtils('')

export default HTNet
