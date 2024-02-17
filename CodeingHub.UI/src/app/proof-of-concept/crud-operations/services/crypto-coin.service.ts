import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class CryptoCoinService {
  private baseUrl = 'http://localhost:3000';

  constructor(private _http: HttpClient) {}

  // createCryptoCoin(data: any): Observable<any> {
  //   return this._http
  //     .post<any>(`${this.baseUrl}/crypto-coin`, data)
  //     .pipe(catchError(this.handleError));
  // }

  getCryptoCoinList(): Observable<any> {
    //return this._http.get(`${this.baseUrl}/crypto-coin`);
    return this._http.get('http://localhost:3000/crypto-coin');
  }

  // // Error handling
  // private handleError(error: any): Observable<never> {
  //   console.error('An error occurred:', error);
  //   return throwError('Something went wrong; please try again later.');
  // }
}

//   createCryptoCoin(data: any): Observable<any> {
//     return this._http
//       .post<any>(`${this.baseUrl}/coins`, data)
//       .pipe(catchError(this.handleError));
//   }

//   getCryptoCoin(id: number): Observable<any> {
//     return this._http
//       .get<any>(`${this.baseUrl}/coins/${id}`)
//       .pipe(catchError(this.handleError));
//   }

//   updateCryptoCoin(id: number, data: any): Observable<any> {
//     return this._http
//       .put<any>(`${this.baseUrl}/coins/${id}`, data)
//       .pipe(catchError(this.handleError));
//   }

//   deleteCryptoCoin(id: number): Observable<any> {
//     return this._http
//       .delete<any>(`${this.baseUrl}/coins/${id}`)
//       .pipe(catchError(this.handleError));
//   }

// }
