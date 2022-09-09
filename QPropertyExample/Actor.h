#ifndef ACTOR_H
#define ACTOR_H

#include <QObject>

class Actor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString lastName READ lastName CONSTANT)
    Q_PROPERTY(QString bestMovie READ bestMovie CONSTANT)
    Q_PROPERTY(int rating READ rating CONSTANT)
    Q_PROPERTY(QString imageURL READ imageURL WRITE setImageURL NOTIFY imageURLChanged)
public:
    Actor(const QString& name, const QString& lastName, const QString& bestMovie, int rating, const QString& imageURL, QObject* parent);

    const QString &name() const;
    const QString &lastName() const;
    const QString &bestMovie() const;
    int rating() const;

    const QString &imageURL() const;
    void setImageURL(const QString &newImageURL);

signals:
    void imageURLChanged();

private:
    const QString m_name;
    const QString m_lastName;
    const QString m_bestMovie;
    const int m_rating;
    QString m_imageURL;

};

#endif // ACTOR_H
