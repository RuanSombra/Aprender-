import 'package:flutter/material.dart';
import 'package:sp_module_c_project/styles/styles.dart';
import 'package:sp_module_c_project/controllers/theme_controller.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/home'),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Cores.azulClaro),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Icon(Icons.person, size: 40, color: Cores.preto),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Cores.azulClaro,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: IconButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Alterar foto de perfil'),
                                  IconButton(
                                    onPressed: () => Navigator.pop(context),
                                    icon: Icon(Icons.close),
                                  ),
                                ],
                              ),
                              content: SingleChildScrollView(
                                child: Text(
                                  'Selecione uma opção para trocar sua foto de perfil',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => (),
                                  child: Text('Tirar foto'),
                                ),
                                TextButton(
                                  onPressed: () => (),
                                  child: Text('Escolher da galeria'),
                                ),
                              ],
                            ),
                          ),
                          icon: Icon(Icons.camera_alt, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(height: 16),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(width * .4, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    backgroundColor: Cores.azulClaro,
                  ),
                  onPressed: () => setState(() {}),
                  label: Text(
                    'Editar Perfil',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.edit, color: Colors.white),
                ),
                Container(height: 16),
                Divider(color: Cores.preto),
                Container(height: 16),
                Row(
                  children: [
                    Text(
                      'Configurações',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Container(height: 8),
                // ... seus widgets acima

                // Seção Configurações com o Switch
                ValueListenableBuilder<bool>(
                  valueListenable: ThemeController.isDarkMode,
                  builder: (context, isDark, _) {
                    return Container(
                      width: width,
                      decoration: BoxDecoration(
                        color: Cores.branco,
                        boxShadow: [
                          BoxShadow(color: Cores.preto, blurRadius: 5),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.dark_mode),
                        title: const Text('Tema Escuro'),
                        trailing: Switch(
                          value: isDark,
                          onChanged: (_) => ThemeController.toggleTheme(),
                        ),
                      ),
                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Cores.branco,
                      boxShadow: [BoxShadow(color: Cores.preto, blurRadius: 5)],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.contrast, color: Cores.preto),
                      title: Text(
                        'Alto Contraste',
                        style: TextStyle(color: Cores.preto, fontSize: 16),
                      ),
                      trailing: Switch(value: false, onChanged: (value) => ()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Cores.branco,
                      boxShadow: [BoxShadow(color: Cores.preto, blurRadius: 5)],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.dark_mode, color: Cores.preto),
                      title: Text(
                        'Idioma: Português (automático)',
                        style: TextStyle(color: Cores.preto, fontSize: 16),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Cores.branco,
                      boxShadow: [BoxShadow(color: Cores.preto, blurRadius: 5)],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.notifications, color: Cores.preto),
                      title: Text(
                        'Notificações',
                        style: TextStyle(color: Cores.preto, fontSize: 16),
                      ),
                      trailing: Switch(value: false, onChanged: (value) => ()),
                    ),
                  ),
                ),

                Container(height: 16),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    backgroundColor: Cores.azulEscuro,
                  ),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  ),
                  label: Text('Sair', style: TextStyle(color: Colors.white)),
                  icon: Icon(Icons.logout, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
