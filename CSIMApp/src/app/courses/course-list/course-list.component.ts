import { Component, OnInit } from '@angular/core';
import { CourseService } from '.././shared/course.service';
import { Course } from '../shared/course.model';
import { log } from 'util';

@Component({
  selector: 'app-course-list',
  templateUrl: './course-list.component.html',
  styleUrls: ['./course-list.component.css']
})
export class CourseListComponent implements OnInit {

  courses: Course[];

  constructor(private courseSvc: CourseService) { }
  
  ngOnInit() {
    this.courseSvc.findAll().subscribe(results => this.courses = results);
    console.log(this.courses);
  }

}

