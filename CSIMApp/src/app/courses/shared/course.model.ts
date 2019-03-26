export class Course {
    code: string;
    title: string;
    instructor: string;
    semester: string;
    credit: number;
    room: string;
    midterm: number;
    final: number;
    assignment: number;
    project: number;

    constructor(params?: Partial<Course>) {
        Object.assign(this, params);
    }
    static parseFrom(object: any): Course {
        const { code, title, instructor, semester, credit, room, midterm, final, assignment, project } = object;
        return new Course({ code, title, instructor, semester, credit, room, midterm, final, assignment, project })
    }
}