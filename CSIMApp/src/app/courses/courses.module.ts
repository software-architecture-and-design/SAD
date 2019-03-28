import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CoursesRoutingModule } from './courses-routing.module';
import { CourseListComponent } from './course-list/course-list.component';
import { CourseDetailsComponent } from './course-details/course-details.component';
import { CourseFormComponent } from './course-form/course-form.component';

import { CourseService } from './shared/course.service';

import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [CourseListComponent, CourseDetailsComponent, CourseFormComponent],
  imports: [
    CommonModule,
    CoursesRoutingModule,
    ReactiveFormsModule,
  ],
  providers: [CourseService]
})
export class CoursesModule { }
