#ifndef ACTORMANAGER_H
#define ACTORMANAGER_H

#include <QObject>
#include "Actor.h"

class ActorManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Actor *singleInstanceActor READ singleInstanceActor CONSTANT)
    Q_PROPERTY(QList<Actor *> actors READ actors NOTIFY actorsChanged)
public:
    ActorManager(QObject* parent);

    Actor *singleInstanceActor() const;

    const QList<Actor *> &actors() const;

signals:
    void actorsChanged();

private:
    Actor* m_singleInstanceActor;
    QList<Actor*> m_actors;
};

#endif // ACTORMANAGER_H
