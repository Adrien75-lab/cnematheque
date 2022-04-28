<?php

namespace App\Repository;

use App\Entity\Films;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Films>
 *
 * @method Films|null find($id, $lockMode = null, $lockVersion = null)
 * @method Films|null findOneBy(array $criteria, array $orderBy = null)
 * @method Films[]    findAll()
 * @method Films[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class FilmsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Films::class);
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function add(Films $entity, bool $flush = true): void
    {
        $this->_em->persist($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(Films $entity, bool $flush = true): void
    {
        $this->_em->remove($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    // /**
    //  * @return Films[] Returns an array of Films objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('f.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Films
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
    /**
     * @return Films[] Returns an array of Films objects
     */
    public function findWithSearch($search)
    {
        $query = $this->createQueryBuilder('p');
        // Films
        if ($search->getFilms()) {
            $query = $query->where('p.id IN (:films)')
                ->setParameter('films', $search->getFilms());
        }
        //Categories
        if ($search->getCategories()) {
            $query = $query->join('p.category', 'c')
                ->andWhere('c.id IN (:categories)')
                ->setParameter('categories', $search->getCategories());
        }

        // Acteurs
        if ($search->getActeurs()) {
            $query = $query->join('p.acteur', 'a')
                ->andWhere('a.id IN (:acteurs)')
                ->setParameter('acteurs', $search->getActeurs());
        }


        //dd($query->getQuery());
        return $query->getQuery()->getResult();
    }

    public function searchFilm($mots)
    {
        $query1 = $this->createQueryBuilder('f');
        if ($mots != null) {
            $query1->andWhere('MATCH_AGAINST(f.titre) AGAINST (:mots boolean) > 0')
                ->setParameter('mots', $mots);
        }
        return $query1->getQuery()->getResult();
    }
}
