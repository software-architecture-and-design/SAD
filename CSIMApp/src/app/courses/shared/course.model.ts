export class Course {
    id: number;
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
    aasm_state: string;

    constructor(params?: Partial<Course>) {
        Object.assign(this, params);
    }
    static parseFrom(object: any): Course {
        const { id, code, title, instructor, semester, credit, room, midterm, final, assignment, project, aasm_state } = object;
        return new Course({ id, code, title, instructor, semester, credit, room, midterm, final, assignment, project, aasm_state })
    }
}