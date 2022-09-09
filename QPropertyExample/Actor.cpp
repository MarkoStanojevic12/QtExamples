#include "Actor.h"

Actor::Actor(const QString& name, const QString& lastName, const QString& bestMovie, int rating, const QString& imageURL, QObject *parent) :
    QObject(parent),
    m_name(name),
    m_lastName(lastName),
    m_bestMovie(bestMovie),
    m_rating(rating),
    m_imageURL(imageURL)
{

}

const QString &Actor::name() const
{
    return m_name;
}

const QString &Actor::imageURL() const
{
    return m_imageURL;
}

void Actor::setImageURL(const QString &newImageURL)
{
    if (m_imageURL == newImageURL)
        return;
    m_imageURL = newImageURL;
    emit imageURLChanged();
}

const QString &Actor::lastName() const
{
    return m_lastName;
}

const QString &Actor::bestMovie() const
{
    return m_bestMovie;
}

int Actor::rating() const
{
    return m_rating;
}
