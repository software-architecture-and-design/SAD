export class Announcement {
    id: number;
    topic: string;
    description: string;
    created_at: Date;

    constructor(params?: Partial<Announcement>) {
        Object.assign(this, params);
    }

    static parseFrom(object: any): Announcement {
        const { id, topic, description, created_at } = object;
        return new Announcement({ id, topic, description, created_at })
    }
}