import { Component, OnInit } from '@angular/core';
import { AnnouncementService } from '.././shared/announcement.service';
import { Announcement } from '../shared/announcement.model';

@Component({
  selector: 'app-announcement-list',
  templateUrl: './announcement-list.component.html',
  styleUrls: ['./announcement-list.component.css']
})
export class AnnouncementListComponent implements OnInit {

  announcements: Announcement[];

  constructor(private announcementSvc: AnnouncementService) { }

  ngOnInit() {
    this.announcementSvc.findAll().subscribe(results => 
      {
        this.announcements = results
        console.log(this.announcements);
      }
    );
  }

}
