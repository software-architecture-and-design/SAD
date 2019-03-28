import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CourseService } from '.././shared/course.service';
import { flatMap } from 'rxjs/operators';
import { Course } from '../shared/course.model';

@Component({
  selector: 'app-course-details',
  templateUrl: './course-details.component.html',
  styleUrls: ['./course-details.component.css']
})
export class CourseDetailsComponent implements OnInit {

  constructor(
              private route: ActivatedRoute,
              private courseSvc: CourseService) { }


  course: Course;

  ngOnInit() {
    
    this.route.params.pipe(
      flatMap(params => this.courseSvc.findById(params.id))
    ).subscribe(course => this.course = course);
    
  }

}
