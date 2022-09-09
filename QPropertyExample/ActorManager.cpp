#include "ActorManager.h"

ActorManager::ActorManager(QObject *parent) :
    QObject(parent),
    m_singleInstanceActor(new Actor("Morgan", "Freeman", "The Shawshank Redemption", 5, "https://www.themoviedb.org/t/p/w500/905k0RFzH0Kd6gx8oSxRdnr6FL.jpg", this))
{
    m_actors.append(new Actor("Morgan", "Freeman", "The Shawshank Redemption", 5, "https://www.themoviedb.org/t/p/w500/905k0RFzH0Kd6gx8oSxRdnr6FL.jpg", this));
    m_actors.append(new Actor("Robert", "De Niro", "The Godfather", 5, "https://www.themoviedb.org/t/p/w500/cT8htcckIuyI1Lqwt1CvD02ynTh.jpg", this));
    m_actors.append(new Actor("Leonardo", "DiCaprio", "Inception", 5, "https://images.squarespace-cdn.com/content/v1/5f58b0094108a94a07e7dbd2/1632133685347-ZUAF7GIW5G6Z3JCRSKDE/LDC+Image+for+web.jpg", this));
    m_actors.append(new Actor("Christian", "Bale", "The Dark Knight", 5, "https://images.mubicdn.net/images/cast_member/4149/cache-505771-1582791456/image-w856.jpg?size=800x", this));
    m_actors.append(new Actor("Tom", "Hanks", "Forrest Gump", 5, "https://www.themoviedb.org/t/p/w500/xndWFsBlClOJFRdhSt4NBwiPq2o.jpg", this));
    m_actors.append(new Actor("Michael", "Cane", "The Dark Knight", 4, "https://the-talks.com/wp-content/uploads/2011/09/Michael-Caine-01.jpg", this));
    m_actors.append(new Actor("Mark", "Ruffalo", "Avengers", 3, "https://pbs.twimg.com/profile_images/672121350689959936/6FZ2iZvr_400x400.png", this));
    m_actors.append(new Actor("Matt", "Damon", "Interstellar", 3, "https://www.juanherranz.com/wp-content/uploads/2022/04/Matt-Damon.jpg", this));
    m_actors.append(new Actor("Marko", "Stanojevic", "Nothing", 2, "https://www.palmassgames.ru/wp-content/uploads/2022/08/unnamed-219.webp", this));

}

Actor *ActorManager::singleInstanceActor() const
{
    return m_singleInstanceActor;
}

const QList<Actor *> &ActorManager::actors() const
{
    return m_actors;
}

