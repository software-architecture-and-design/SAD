import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AnnouncementService } from '.././shared/announcement.service';
import { flatMap } from 'rxjs/operators';
import { Announcement } from '../shared/announcement.model';

@Component({
  selector: 'app-announcement-details',
  templateUrl: './announcement-details.component.html',
  styleUrls: ['./announcement-details.component.css']
})
export class AnnouncementDetailsComponent implements OnInit {

  constructor(
    private route: ActivatedRoute,
    private announcementSvc: AnnouncementService) { }


  announcement: Announcement;

  ngOnInit() {
    this.route.params.pipe(
      flatMap(params => this.announcementSvc.findById(params.id))
      ).subscribe(announcement => this.announcement = announcement);
  }

}
