import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment2 } from '../../../environments/environment';
import { Announcement } from './announcement.model';
import { map } from 'rxjs/operators';

const ANNOUNCEMENTS_URL = `${environment2.apiBaseUrl}/announcements`;

@Injectable()

export class AnnouncementService {
    constructor(private httpClient: HttpClient) { }

    search(query: string): Observable<Announcement[]> { return null; }

    findAll(): Observable<Announcement[]> {
        return this.httpClient.get(ANNOUNCEMENTS_URL+".json").pipe(
        map((resp: any) => resp.map(obj => Announcement.parseFrom(obj)))
        );
    }
    findById(id: number): Observable<Announcement> { 
        return this.httpClient.get(`${ANNOUNCEMENTS_URL}/${id}.json`).pipe(
            map((resp: any) => Announcement.parseFrom(resp))
        );
    }
    create(quotation: Partial<Announcement>): Observable<Announcement> { return null; }

    destroy(quotation: Partial<Announcement>): Observable<any> { return null; }
}