import 'package:flutter/material.dart';
import 'package:reservation_app/data/company_info_model.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/utils/assets_management.dart';

class DrawerLogOut extends StatelessWidget {
  const DrawerLogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Image.asset(
                    AssetsManagement.logoWithText,
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Image.asset(
                        AssetsManagement.avatarPlaceholder,
                        fit: BoxFit.fill,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            'GUEST',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RouteNamed.signUpPage);
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2.8,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF9D170F),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(
                                    'Sign up',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEB),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.home_outlined,
                                size: 35, color: Color(0xFF9D170F)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Home',
                              style: TextStyle(
                                  color: Color(0xFF9D170F), fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Color(0xFFFFE0DC),
                      thickness: 1,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNamed.aboutUsPage);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.info_outline,
                                size: 35, color: Color(0xFF9D170F)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'About us',
                              style: TextStyle(
                                  color: Color(0xFF9D170F), fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Color(0xFFFFE0DC),
                      thickness: 1,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNamed.loginPage);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.login,
                                size: 35, color: Color(0xFF9D170F)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  color: Color(0xFF9D170F), fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(companyInfoMockData.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15)),
                  Text(companyInfoMockData.address,
                      style: const TextStyle(fontSize: 15)),
                  Text(companyInfoMockData.gpk,
                      style: const TextStyle(fontSize: 15)),
                  Text(companyInfoMockData.phoneNumber,
                      style: const TextStyle(fontSize: 15)),
                  Text(companyInfoMockData.email,
                      style: const TextStyle(fontSize: 15)),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
