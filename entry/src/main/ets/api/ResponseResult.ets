export class ResponseResult<T> {
  errorCode: number;
  errorMsg: string;
  data?: T | Object | string;
}
