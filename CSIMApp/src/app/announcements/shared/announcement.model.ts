export class Announcement {
    id: number;
    topic: string;
    description: string;

    constructor(params?: Partial<Announcement>) {
        Object.assign(this, params);
    }

    static parseFrom(object: any): Announcement {
        const { id, topic, description } = object;
        return new Announcement({ id, topic, description })
    }
}