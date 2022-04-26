<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\EditUserType;
use Doctrine\ORM\EntityManager;
use App\Repository\UserRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


class AccountController extends AbstractController
{
    /**
     * @Route("/account", name="app_account")
     */
    public function index(): Response
    {
        return $this->render('account/index.html.twig');
    }
    /**
     * @Route("//utilisateurs",name="utilisateurs")
     *
     */
    public function usersList(UserRepository $users)
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');
        // Ici il faut être admin
        return $this->render('account/users.html.twig', [
            'users' => $users->findAll()
        ]);
    }
    /**
     * @IsGranted("ROLE_ADMIN")
     * @Route("/modifier{id}", name="modifier_utilisateur")
     *
     */
    public function editUser(User $user, Request $request, ManagerRegistry $doctrine)
    {
        $form = $this->createForm(EditUserType::class, $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $doctrine->getManager();
            $entityManager->persist($user);
            $entityManager->flush();
            $this->addFlash('message', 'utilisateur modifié aec succes');
            return $this->redirectToRoute('utilisateurs');
        }
        return $this->render('account/edituser.html.twig', [
            'userForm' => $form->createView()
        ]);
    }
}
