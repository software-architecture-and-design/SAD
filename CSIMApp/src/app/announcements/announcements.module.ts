import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AnnouncementsRoutingModule } from './announcements-routing.module';
import { AnnouncementListComponent } from './announcement-list/announcement-list.component';
import { AnnouncementDetailsComponent } from './announcement-details/announcement-details.component';

import { AnnouncementService } from './shared/announcement.service';

@NgModule({
  declarations: [AnnouncementListComponent, AnnouncementDetailsComponent],
  imports: [
    CommonModule,
    AnnouncementsRoutingModule
  ],
  providers: [AnnouncementService]
})
export class AnnouncementsModule { }
