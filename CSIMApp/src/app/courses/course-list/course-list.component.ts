import { Component, OnInit } from '@angular/core';
import { CourseService } from '.././shared/course.service';
import { Course } from '../shared/course.model';
import { log } from 'util';
import { FormControl } from '@angular/forms';
import { debounceTime, switchMap } from 'rxjs/operators';

@Component({
  selector: 'app-course-list',
  templateUrl: './course-list.component.html',
  styleUrls: ['./course-list.component.css']
})
export class CourseListComponent implements OnInit {

  courses: Course[];
  searchQuery = new FormControl();

  constructor(private courseSvc: CourseService) { }
  
  ngOnInit() {
    this.courseSvc.findAll().subscribe(results => 
      {
        this.courses = results
        console.log(this.courses);
      }
    );

    this.searchQuery.valueChanges.pipe(
      debounceTime(500),
      switchMap(value => this.courseSvc.search(value))
    ).subscribe(results => this.courses = results);

  }

}

