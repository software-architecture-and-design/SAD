import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';
import { Course } from './course.model';
import { map } from 'rxjs/operators';

const COURSE_URL = `${environment.apiBaseUrl}/courses`;

@Injectable()

export class CourseService {

    constructor(private httpClient: HttpClient) { }

    search(query: string): Observable<Course[]> {
        return this.httpClient.get(`${COURSE_URL}?q=${query}`).pipe(
            map((resp: any) => resp.map(obj => Course.parseFrom(obj)))
        );
    }
    findAll(): Observable<Course[]> {
        return this.httpClient.get(COURSE_URL).pipe(
            map((resp: any) => resp.map(obj => Course.parseFrom(obj)))
        );
    }
    findById(id: number): Observable<Course> { 
        return this.httpClient.get(`${COURSE_URL}/${id}`).pipe(
            map((resp: any) => Course.parseFrom(resp))
        );
     }
    create(course: Partial<Course>): Observable<Course> { return null; }
    destroy(course: Partial<Course>): Observable<any> { return null; }
}